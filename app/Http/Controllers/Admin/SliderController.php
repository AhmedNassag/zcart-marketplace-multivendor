<?php

namespace App\Http\Controllers\Admin;

use App\Models\Slider;
use App\Common\Authorizable;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use App\Repositories\Slider\SliderRepository;
use App\Http\Requests\Validations\CreateSliderRequest;
use App\Http\Requests\Validations\UpdateSliderRequest;

class SliderController extends Controller
{
    use Authorizable;

    private $model;

    private $slider;

    /**
     * construct
     */
    public function __construct(SliderRepository $slider)
    {
        parent::__construct();

        $this->slider = $slider;

        $this->model = trans('app.model.slider');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sliders = Slider::with('featureImage', 'mobileImage')
            ->where('shop_id', Auth::user()->shop_id)
            ->orderBy('order', 'asc')->get();

        return view('admin.slider.index', compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.slider._create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateSliderRequest $request)
    {
        $this->slider->store($request);

        // Clear sliders from cache
        // Clear sliders from cache
        if ($request->shop_id) {
            Cache::forget('sliders' . $request->shop_id);
        } else {
            Cache::forget('sliders');
        }

        return back()->with('success', trans('messages.created', ['model' => $this->model]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function edit(Slider $slider)
    {
        return view('admin.slider._edit', compact('slider'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateSliderRequest $request, Slider $slider)
    {
        $this->slider->update($request, $slider);

        // Clear sliders from cache
        if ($slider->shop_id) {
            Cache::forget('sliders' . $slider->shop_id);
        } else {
            Cache::forget('sliders');
        }

        return back()->with('success', trans('messages.updated', ['model' => $this->model]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function destroy(Slider $slider)
    {
        $slider->flushImages();

        $slider->forceDelete();

        // Clear sliders from cache
        if ($slider->shop_id) {
            Cache::forget('sliders' . $slider->shop_id);
        } else {
            Cache::forget('sliders');
        }

        return back()->with('success', trans('messages.deleted', ['model' => $this->model]));
    }

    /**
     * Trash the mass resources.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function massDestroy(Request $request)
    {
        $this->slider->massDestroy($request->ids);

        // Clear sliders from cache
        if (Auth::user()->shop_id) {
            Cache::forget('sliders' . Auth::user()->shop_id);
        } else {
            Cache::forget('sliders');
        }

        if ($request->ajax()) {
            return response()->json(['success' => trans('messages.deleted', ['model' => $this->model])]);
        }

        return back()->with('success', trans('messages.deleted', ['model' => $this->model]));
    }
}
