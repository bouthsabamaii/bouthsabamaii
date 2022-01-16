<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Store;
use App\Models\Transection;
use Intervention\Image\Facades\Image;

class StoreController extends Controller
{
    
    public function index(){
        $search = \Request::get('s');
        $store = Store::orderBy('created_at', 'desc')
        ->where('name','LIKE',"%{$search}%")
        ->paginate(10)
        ->toArray();
        return array_reverse($store);
    }

    public function pos(){
        $search = \Request::get('s');
        $store = Store::orderBy('created_at', 'desc')
        ->where('name','LIKE',"%{$search}%")
        ->paginate(20)
        ->toArray();
        return array_reverse($store);
    }

    public function add(Request $request){
        try {

            if($request->file('file')){
                $upload_path = 'assets/images';
                $generated_new_name = time() . '.' . $request->file->getClientOriginalExtension();
                $image = $request->file('file');
                $img = Image::make($image->getRealPath());
                $img->resize(800, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
                $img->save($upload_path.'/'.$generated_new_name);
            } else { $generated_new_name = ''; }

            $store = new Store();
            $store->name = $request->name;
            $store->images = $generated_new_name;
            $store->amount = $request->amount;
            $store->price_buy = $request->price_buy;
            $store->price_sell = $request->price_sell;
            $store->save();
            $product_id = $store->id;

            /// ບັນທຶກລາຍຈ່າຍຊື້ສິນຄ້າ
            $acc_type = 'expense';
            $tran = Transection::all()->sortByDesc('id')->take(1)->toArray();
            $number = 1;
            foreach($tran as $new)
            {
                $number = $new['tran_id'];
            }
            if($number!=''){
                $number1 = str_replace("INC","",$number);
                $number2 = str_replace("EXP","",$number1);
                $number = (int)$number2+1;
                $length = 5;
                $number = substr(str_repeat(0, $length).$number, - $length);
            }

            if($acc_type=='income'){ $tnum = 'INC'; }
            elseif($acc_type=='expense'){ $tnum = 'EXP'; }

            $store = new Transection();
            $store->tran_id = $tnum.$number;
            $store->product_id = $product_id;
            $store->tran_type = $acc_type;
            $store->tran_detail = 'ນຳເຂົ້າສິນຄ້າ: '.$request->name;
            $store->amount = $request->amount;
            $store->price = $request->amount*$request->price_buy;
            $store->save();
            // ຈົບການບັນທຶກ

            $success = true;
            $message = 'add success!';
        } catch (\Illuminate\Database\QueryException $ex) {
            $success = false;
            $message = $ex->getMessage();
        }

        // response
        $response = [
            'success' => $success,
            'message' => $message,
        ];
        return response()->json($response);
    }

    public function edit($id){

        $store = Store::find($id);
        return response()->json($store);
    }

    public function update($id, Request $request){
        try {

            $store = Store::find($id);

            if($request->file('file')){
                
                $upload_path = 'assets/images';

                /// ທຳການລຶບໄຟລ໌ເກົ່າ
                if($store->images!='' && $store->images!= null){
                    if(file_exists('assets/images/'.$store->images)){
                    unlink('assets/images/'.$store->images);
                    }
                }
                

                $generated_new_name = time() . '.' . $request->file->getClientOriginalExtension();
                $image = $request->file('file');
                $img = Image::make($image->getRealPath());
                $img->resize(800, null, function ($constraint) {
                    $constraint->aspectRatio();
                });
                
                $img->save($upload_path.'/'.$generated_new_name);

                $store->update([
                    'name' => $request->name,
                    'images' => $generated_new_name,
                    'amount' => $request->amount,
                    'price_buy' => $request->price_buy,
                    'price_sell' => $request->price_sell
                ]);

            } else { 
                
                $store->update([
                    'name' => $request->name,
                    'amount' => $request->amount,
                    'price_buy' => $request->price_buy,
                    'price_sell' => $request->price_sell
                ]);
             }


            

            $success = true;
            $message = 'update success!';
        } catch (\Illuminate\Database\QueryException $ex) {
            $success = false;
            $message = $ex->getMessage();
        }

        // response
        $response = [
            'success' => $success,
            'message' => $message,
        ];
        return response()->json($response);
    }

    public function delete($id){

        try {

            $user = Store::find($id);
            $user->delete();

            $success = true;
            $message = 'delete success!';
        } catch (\Illuminate\Database\QueryException $ex) {
            $success = false;
            $message = $ex->getMessage();
        }

        // response
        $response = [
            'success' => $success,
            'message' => $message,
        ];
        return response()->json($response);

    }
}
