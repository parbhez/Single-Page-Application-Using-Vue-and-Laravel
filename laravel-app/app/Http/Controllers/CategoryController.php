<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{

    public function index()
    {
        //
    }


    public function get_category()
    {
        try{
            $category = Category::active([0,1])->orderShow()->paginate(10);
            if(count($category) > 0){
                return response()->json(['success' => 'success', 'msg' => 'Category Retrieve successfully', 'code' => 200, 'result' => $category]);
            }else{
                return response()->json(['error' => 'error', 'msg' => 'No Data Available', 'code' => 200, 'result' => []]);
            }

        }catch(QueryException $e){
            return response()->json(['error' => 'error', 'msg' => 'Database Connection Failed', 'code' => 500, 'result' => $e->getMessage()]);
        }
    }

    public function delete_category($id)
    {

        try{
            $category = Category::whereId($id)->first();
            if($category){
                $category->delete();
                return response()->json(['success' => 'success', 'msg' => 'Category deleted successfully !', 'code' => 202, 'result' => $category]);
            }else{
                return response()->json(['error' => 'error', 'msg' => 'Opps ! Category does not deleted !', 'code' => 404, 'result' => []]);
            }
        }catch(\Illuminate\Database\QueryException $e){
            return response()->json(['error' => 'error', 'msg' => 'Something Went Wrong !', 'code' => 500, 'result' => $e->errorInfo[2]]);
        }
    }

    public function update_category($id, Request $request)
    {
        $validatedData = $request->validate([
            'category_name' => [ 'required', 'unique:categories,name,' . $id, 'max:255' ],
        ]);

        try{
            $category = Category::whereId($request->id)->first();
            $category->name = $request->category_name;
            $update = $category->update();

        if($update){
            return response()->json(['success' => 'success', 'msg' => 'Category Updated successfully !', 'code' => 200, 'result' => $update]);
        }else{
            return response()->json(['error' => 'error', 'msg' => 'Category does not Updated !', 'code' => 204, 'result' => []]);
        }

        }catch(\Illuminate\Database\QueryException $e){
            return response()->json(['error' => 'error', 'msg' => 'Something Went Wrong !', 'code' => 500, 'result' => $e->errorInfo[2]]);
        }
    }



    public function get_product()
    {
        return Category::active([0,1])->orderShow()->paginate(10);
    }

    public function search_product($queryFiled, $query)
    {
        return Category::active([0,1])
        ->orderShow()
        ->where($queryFiled, 'LIKE', '%' . request('query') . '%')
        ->latest()->paginate(10);
    }


    public function save_category(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'categories.*.category_name' => ['required', 'unique:categories,name']
        ]);

        if($validator->fails()){
            return response()->json(['error' => 'error', 'msg' => 'Client Side Errors !!', 'code' => 422, 'result' => $validator->errors()]);
        }

       try{
        $serial = 0;
        foreach($request->categories as $cat){
            Category::create([
               'name' => $cat['category_name'],
               'status' => 1,
               'created_by' => 1,
            ]);
            $serial++;
          }
          if($serial > 0){
            return response()->json(['success' => 'success', 'msg' => 'Category Inserted !', 'code' => 200, 'result' => $serial]);
          }else{
            return response()->json(['error' => 'error', 'msg' => 'Category Not Inserted !', 'code' => 500, 'result' => $serial]);
          }
       }catch(\Illuminate\Database\QueryException $e){
        //return $e;
        return response()->json(['error' => 'error', 'msg' => 'Something Went Wrong !', 'code' => 500, 'result' => $e->errorInfo[2]]);
       }

    }

    public function save_product(Request $request)
    {
        $this->validate($request, [
            'product_name' => 'required',
        ]);

       return $request;


    }

    public function store_product(Request $request){


        $validatedData = $request->validate([
            'category_name' => ['required', 'unique:categories,name', 'max:255'],
        ]);

        try{
            $save = Category::create([
                'name' => $request->category_name,
                'status' => 1,
                'created_by' => 1,
            ]);
        if($save){
            return response()->json(['success' => 'success', 'msg' => 'Category Inserted !', 'code' => 200, 'result' => $save]);
        }else{
            return response()->json(['error' => 'error', 'msg' => 'Category does not Inserted !', 'code' => 204, 'result' => []]);
        }

        }catch(\Illuminate\Database\QueryException $e){
            return response()->json(['error' => 'error', 'msg' => 'Something Went Wrong !', 'code' => 500, 'result' => $e->errorInfo[2]]);
        }

    }

    public function delete_product($id)
    {
        try{
            $product = Category::whereId($id)->first();
            if($product){
                $product->delete();
                return response()->json(['success' => 'success', 'msg' => 'Category deleted successfully !', 'code' => 202, 'result' => $product]);
            }else{
                return response()->json(['error' => 'error', 'msg' => 'Opps ! Data not found !', 'code' => 404, 'result' => []]);
            }
        }catch(\Illuminate\Database\QueryException $e){
            return response()->json(['error' => 'error', 'msg' => 'Something Went Wrong !', 'code' => 500, 'result' => $e->errorInfo[2]]);
        }
    }

    public function update_product(Request $request)
    {

        $validatedData = $request->validate([
            //'name' => [ 'required', 'unique:categories,name,' . $request->id, 'max:255' ],
            'name' => ['required', Rule::unique('categories')->ignore($request->id)]
        ]);

        try{

            $product = Category::whereId($request->id)->first();
            $product->name = $request->name;
            $update = $product->update();

        if($update){
            return response()->json(['success' => 'success', 'msg' => 'Category Updated !', 'code' => 200, 'result' => $update]);
        }else{
            return response()->json(['error' => 'error', 'msg' => 'Category does not Updated !', 'code' => 204, 'result' => []]);
        }

        }catch(\Illuminate\Database\QueryException $e){
            return response()->json(['error' => 'error', 'msg' => 'Something Went Wrong !', 'code' => 500, 'result' => $e->errorInfo[2]]);
        }
    }

    public function another_update_product(Request $request)
    {

        $validatedData = $request->validate([
            //'name' => [ 'required', 'unique:categories,name,' . $request->id, 'max:255' ],
            'name' => ['required', Rule::unique('categories')->ignore($request->id)]
        ]);

        try{

            $product = Category::whereId($request->id)->first();
            $product->name = $request->name;
            $update = $product->update();

        if($update){
            return response()->json(['success' => 'success', 'msg' => 'Category Updated !', 'code' => 200, 'result' => $update]);
        }else{
            return response()->json(['error' => 'error', 'msg' => 'Category does not Updated !', 'code' => 204, 'result' => []]);
        }

        }catch(\Illuminate\Database\QueryException $e){
            return response()->json(['error' => 'error', 'msg' => 'Something Went Wrong !', 'code' => 500, 'result' => $e->errorInfo[2]]);
        }
    }

    public function show(Category $category)
    {
        //
    }


    public function edit(Category $category)
    {
        //
    }

    public function update(Request $request, Category $category)
    {
        //
    }


    public function destroy(Category $category)
    {
        //
    }
}
