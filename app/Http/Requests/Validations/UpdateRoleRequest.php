<?php

namespace App\Http\Requests\Validations;

use App\Http\Requests\Request;

class UpdateRoleRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $shop_id = Request::user()->merchantId(); // Get current user's shop_id
        $id = $this->route('role');        // Current model ID

        $rules = [];
        $rules['name'] = 'bail|required|composite_unique:roles,name,shop_id:' . $shop_id . ', ' . $id;

        if (Request::user()->accessLevel()) {
            $rules['level'] = 'nullable|integer|between:' . Request::user()->accessLevel() . ',' . config('system_settings.max_role_level');
        }

        if (Request::input('level') && !Request::user()->accessLevel()) {
            Request::replace(['level' => null]); // Reset the level
        }

        return $rules;
    }
}
