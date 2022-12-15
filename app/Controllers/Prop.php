<?php namespace App\Controllers;
 
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;
use App\Models\mPropta;
 
class Prop extends ResourceController
{
    use ResponseTrait;
    // get all product
    public function index()
    {
        $model = new mPropta();
        $data = $model->findAll();
        return $this->respond($data, 200);
    }
 
    // get single product
    public function show($id = null)
    {
        $model = new mPropta();
        $data = $model->getWhere(['idProp' => $id])->getResult();
        if($data){
            return $this->respond($data);
        }else{
            return $this->failNotFound('No Data Found with id '.$id);
        }
    }
 
    // create a product
    public function create()
    {
        $model = new mPropta();
        $data = [
            //'product_name' => $this->request->getPost('product_name'),
            //'product_price' => $this->request->getPost('product_price')
        ];
        $data = json_decode(file_get_contents("php://input"));
        //$data = $this->request->getPost();
        $model->insert($data);
        $response = [
            'status'   => 201,
            'error'    => null,
            'messages' => [
                'success' => 'Data Saved'
            ]
        ];
         
        return $this->respondCreated($data, 201);
    }
 
    // update product
    public function update($id = null)
    {
        /*$this->request->getPost('status');
        $this->request->getPost('idProp');*/
        $model = new mPropta();
        $json = $this->request->getJSON();
        if($json){
            $data = [
                'status' => $json->status
                //'isProp' => $json->isProp
            ];
        }else{
            $input = $this->request->getRawInput();
            $data = [
                'status' => $this->request->getPost['status']
                //'isProp' => $input['isProp']
            ];
        }

        // Insert to Database
        $model->update($id, $data);
        $response = [
            'status'   => 200,
            'error'    => null,
            'messages' => [
                'success' => 'Data Updated'
            ]
        ];
        return $this->respond($response);
    }
 
    // delete product
    public function delete($id = null)
    {
        $model = new mPropta();
        $data = $model->find($id);
        if($data){
            $model->delete($id);
            $response = [
                'status'   => 200,
                'error'    => null,
                'messages' => [
                    'success' => 'Data Deleted'
                ]
            ];
             
            return $this->respondDeleted($response);
        }else{
            return $this->failNotFound('No Data Found with id '.$id);
        }
    }
}