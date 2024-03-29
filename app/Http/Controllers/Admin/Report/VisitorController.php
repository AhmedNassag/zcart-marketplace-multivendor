<?php

namespace App\Http\Controllers\Admin\Report;

use App\Models\Visitor;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;

class VisitorController extends Controller
{
    /**
     * Get the performance indicators for the application.
     *
     * @return Response
     */
    public function index()
    {
        return view('admin.report.platform.visitors');
    }

    public function ban(Request $request, Visitor $visitor)
    {
        $visitor->delete();

        return redirect()->back()->with('success', trans('messages.the_ip_banned'));
    }

    public function unban(Request $request, $id)
    {
        $visitor = Visitor::onlyTrashed()->findOrFail($id)->restore();

        return redirect()->back()->with('success', trans('messages.the_ip_unbanned'));
    }

    // function will process the ajax request
    public function getVisitors(Request $request)
    {
        // $visitors = Visitor::orderBy('hits', 'desc')->withTrashed()->get();
        $visitors = Visitor::orderBy('hits', 'desc')->limit(1000)->get();

        return Datatables::of($visitors)
            ->addColumn('flag', function ($visitor) {
                return view('admin.partials.actions.visitor.flag', compact('visitor'));
            })
            ->addColumn('option', function ($visitor) {
                return view('admin.partials.actions.visitor.options', compact('visitor'));
            })
            ->editColumn('last_visits', function ($visitor) {
                return view('admin.partials.actions.visitor.last_visits', compact('visitor'));
            })
            ->rawColumns(['flag', 'last_visits', 'option'])
            ->make(true);
    }
}
