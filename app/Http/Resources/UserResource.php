<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Auth;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->getName(),
            'email' => $this->email,
            'member_since' => optional($this->created_at)->diffForHumans(),
            'active' => (bool) $this->active,
            'avatar' => get_avatar_src($this, 'small'),
            $this->mergeWhen($request->is('api/vendor/*'), [
                'role_id' => optional($this->role)->id,
                'nice_name' => $this->nice_name,
                'description' => $this->description,
            ])
        ];
    }
}
