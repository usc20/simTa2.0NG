<?php

namespace App\Controllers;
use App\Models\mPropta;

class Home extends BaseController
{
    public function index()
    {
        return view('dashboard');
    }

    public function proposal(){
        return view('proposal');
    }

    public function bimbingan(){
        return view('bimbingan');
    }

    public function detail($id){
        $url =  base_url('Prop/'.$id);
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,$url);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_CONNECTTIMEOUT, 4);
        $json = curl_exec($ch);
        if(!$json) {
            echo curl_error($ch);
        }
        curl_close($ch);
        $data['det'] = json_decode($json);
        
        return view('detailta',$data);
    }

    public function edit($id){
        $prop = new Mpropta();
        $data['proposal'] = $prop->where('idProp', $id)->first();

        $newData = [
            'status' => $this->request->getPost('status')
        ];
        
        $prop->update($id,$newData);

        return redirect()->to(base_url('Detailta').'/'.$id);
        //$url =  base_url('Prop/update/'.$id);

    }
}
