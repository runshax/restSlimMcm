<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

$app->options('/{routes:.+}', function ($request, $response, $args) {
    return $response;
});

$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
});

//Begin function MCM


//for Register New Akun
$app->post('/api/doRegister', function(Request $request, Response $response){

        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();
        
    $username = $request->getParam('username');
    $email = $request->getParam('email');
    $password = md5($request->getParam('password'));
    
    $token = $request->getParam('token');
    $newTokenReq = $request->getParam('newTokenReq');
    $varKeyNotMaster=0;
       
      
   if(empty($token)){
   
                if($newTokenReq == "none"){
                  $ss="";
         
                }
                else{
                   $varKeyNotMaster=1;      
                   $ss=get_impin_code(6);
                }
   
   }
   else{
   
           //lets find if token exist
           $resulten=array();
           $sqlCek = "SELECT a.* FROM mcm_user a WHERE a.shareData='".$token."'";
   
            try{
               
        
                $res = $db->prepare($sqlCek);
                $res->execute();
                
                while ($row_result = $res->fetch()) {
                $resulten[]=$row_result;
                }
                
                
            
            }
            catch(PDOException $e){
            
            echo '{"error": {"text": '.$e->getMessage().'}';
            
            }
            
           
           if(empty($resulten)){
             echo json_encode(array(
                'success' => false));
                
                return;
            
            }
            
            else{
                    
             $ss=$token;
            }
   
   }
   
  

    $sql = "INSERT INTO dbwizku.mcm_user (username,email,password,shareData,masterType) VALUES
    (:username,:email,:password,:shareData,:masterType)";

    try{
       

        $stmt = $db->prepare($sql);

        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':email',  $email);
        $stmt->bindParam(':password',$password);
        $stmt->bindParam(':shareData',$ss);
        $stmt->bindParam(':masterType',$varKeyNotMaster);

        $result=$stmt->execute();
        
        if($result){
        
        $tokenResult="no";
        
        if(!empty($ss)){
        $tokenResult=$ss;
        }
        
         echo json_encode(array(
        'success' => true,
        'tokenShared'=> $tokenResult,
        'resultRegister' => $result));
        
        }
        else{
        
        echo json_encode(array(
        'success' => false));
        
        }
        
     

    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});
//end register new akun



//for Login Akun


$app->get('/api/doLogin/{username}/{password}', function(Request $request, Response $response){
    $username = $request->getAttribute('username');
    $password = $request->getAttribute('password');
    
    
     // Get DB Object
     $db = new db();
     // Connect
     $db = $db->connect();
        
        
          //lets find if token exist
           $resulten=array();
           $sqlCek = "SELECT a.* FROM mcm_user a WHERE a.username='".$username."' and a.password='".md5($password)."' limit 1";
   
            try{
               
        
                $res = $db->prepare($sqlCek);
                $res->execute();
                
                while ($row_result = $res->fetch()) {
                $resulten[]=$row_result;
                
                }
                
               
                
                
            
            }
            catch(PDOException $e){
            
            echo '{"error": {"text": '.$e->getMessage().'}';
            
            }
            
            if(!empty($resulten)){
            
            
                echo json_encode(array(
                'success' => true,
                'id'=> $resulten[0]['id'],
                'username'=> $resulten[0]['username'],
                'email'=> $resulten[0]['email'],
                'shareData'=> $resulten[0]['shareData'],
                'masterType'=> $resulten[0]['masterType']));
                
            
            }
            
            else{
            
             echo json_encode(array('success' => false));
            
            }
            
    
    // echo json_encode($id." ".$ids);

   
});




//end login akun



//for Save Expense
$app->post('/api/doSaveExpense', function(Request $request, Response $response){

        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();
        
    $expense_name = $request->getParam('expense_name');
    $datex = $request->getParam('datex');
    $amount = $request->getParam('amount');
    $username = $request->getParam('username');
    $time = date('H:i:s');
    
      
  

    $sql = "INSERT INTO dbwizku.mcm_expense (expense_name,date,time,amount,username) VALUES
    (:expense_name,:date,:time,:amount,:username)";

    try{
       

        $stmt = $db->prepare($sql);

        $stmt->bindParam(':expense_name', $expense_name);
        $stmt->bindParam(':date',  $datex);
        $stmt->bindParam(':time',  $time);
        $stmt->bindParam(':amount',$amount);
        $stmt->bindParam(':username',$username);

        $result=$stmt->execute();
        
        if($result){
        
        echo json_encode(array(
        'success' => true,
        'lastID'=> '1'));
        
        }
        else{
        
        echo json_encode(array(
        'success' => false));
        
        }
        
     

    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});
//end Save Expense


// Update Password User
$app->post('/api/doChangePass', function(Request $request, Response $response){
    
    $username = $request->getParam('username');
    $password = $request->getParam('password');
    
    
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();


    

    $sql = "UPDATE dbwizku.mcm_user SET
		password = '".md5($password)."'
		WHERE username = '".$username."'";

    try{
       
       
                
        $stmt = $db->prepare($sql);

      

        $stmt->execute();

         echo json_encode(array(
        'success' => true));
        

    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});

//end Update Password User



//for view report Expense

$app->get('/api/doViewExpense/{username}/{key_search}', function(Request $request, Response $response){
    $username = $request->getAttribute('username');
    $key_search = $request->getAttribute('key_search');
    
    
   
                
     // Get DB Object
     $db = new db();
     // Connect
     $db = $db->connect();
        
        
          //lets find if token exist
           $resulten=array();
           $key_search="";
           
           if(!empty($key_search)){
           
           //donothing for now
         //  SELECT * FROM `mcm_expense` where expense_name like '%baso%' 
         
           $sqlCek = " SELECT * FROM `mcm_expense` where expense_name like '%baso%' ";
           
           }
           else{
           
           
           
            $sqlCek="SELECT t1.shareData, (
				select
				GROUP_CONCAT(DISTINCT(username) SEPARATOR ',')
				from `mcm_user` where shareData=t1.shareData
				) as username
                
                FROM `mcm_user` t1
           	where t1.username = '".$username."'";
                $res = $db->prepare($sqlCek);
                $res->execute();
                
                $row_result = $res->fetch();
                
                $tempStringUser="";
                $stringUser="";
                $finalUserUsed="";
                if(!empty($row_result['username']) and (!empty($row_result['shareData']) or $row_result['shareData'] != 0) ){
                
                     $tempStringUser=explode(",",$row_result['username']);
                     
                     foreach($tempStringUser as $reformatUsername){
                     
                            $stringUser[]="'".$reformatUsername."'"; 
                     
                     }
                     
                      $finalUserUsed=implode(",",$stringUser);
                     
                     
                     //return  $finalUserUsed; 
                }
                else{
                $finalUserUsed="'".$username."'";
                }
                
                
                
                        
                        
           $sqlCek = "
           SELECT t2.*,t1.shareData FROM `mcm_user` t1
           left join mcm_expense t2 on t1.username = t2.username
           where t1.username in (".$finalUserUsed.")  and t2.amount > 0 
           ";
   
           
           }
           
           
            try{
               
        
                $res = $db->prepare($sqlCek);
                $res->execute();
                
                
                while ($row_result = $res->fetch()) {
                $resulten[]=array("expense_name"=>$row_result['expense_name'],
                                "date_expense"=>$row_result['date'],
                                "time_expense"=>$row_result['time'],
                                "amount"=>$row_result['amount']);
                
                }
                
               
                
                
            
            }
            catch(PDOException $e){
            
            echo '{"error": {"text": '.$e->getMessage().'}';
            
            }
            
            if(!empty($resulten)){
                
                echo json_encode(array(
                'success' => true,
                'DATAArray'=>  $resulten));
                
            
            }
            
            else{
            
             echo json_encode(array('success' => false));
            
            }
            
    
    // echo json_encode($id." ".$ids);

   
});




//end view report Expense




//for Save Budget
$app->post('/api/doSaveBudget', function(Request $request, Response $response){

        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();
        
    $date_budget = $request->getParam('date_budget');
    $amount = $request->getParam('amount');
    $username = $request->getParam('username');
    $sharedData = $request->getParam('sharedData');
    
      
  

    $sql = "REPLACE INTO dbwizku.mcm_budget (date_budget,amount,username,sharedData) VALUES
    (:date_budget,:amount,:username,:sharedData)";

    try{
       

        $stmt = $db->prepare($sql);

        $stmt->bindParam(':date_budget', $date_budget);
        $stmt->bindParam(':amount',  $amount);
        $stmt->bindParam(':username',  $username);
        $stmt->bindParam(':sharedData',$sharedData);

        $result=$stmt->execute();
        
        if($result){
        
        echo json_encode(array(
        'success' => true,
        'date_budget'=> $date_budget,
        'amount'=> $amount,
        'sharedData'=> $sharedData));
        
        }
        else{
        
        echo json_encode(array(
        'success' => false));
        
        }
        
     

    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});
//end Save Budget




//End Function MCM



// Update Customer
$app->put('/api/customer/update/{id}', function(Request $request, Response $response){
    $id = $request->getAttribute('id');
    $first_name = $request->getParam('first_name');
    $last_name = $request->getParam('last_name');
    $phone = $request->getParam('phone');
    $email = $request->getParam('email');
    $address = $request->getParam('address');
    $city = $request->getParam('city');
    $state = $request->getParam('state');

    $sql = "UPDATE customers SET
				first_name 	= :first_name,
				last_name 	= :last_name,
                phone		= :phone,
                email		= :email,
                address 	= :address,
                city 		= :city,
                state		= :state
			WHERE id = $id";

    try{
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->prepare($sql);

        $stmt->bindParam(':first_name', $first_name);
        $stmt->bindParam(':last_name',  $last_name);
        $stmt->bindParam(':phone',      $phone);
        $stmt->bindParam(':email',      $email);
        $stmt->bindParam(':address',    $address);
        $stmt->bindParam(':city',       $city);
        $stmt->bindParam(':state',      $state);

        $stmt->execute();

        echo '{"notice": {"text": "Customer Updated"}';

    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});

// Delete Customer
$app->delete('/api/customer/delete/{id}', function(Request $request, Response $response){
    $id = $request->getAttribute('id');

    $sql = "DELETE FROM customers WHERE id = $id";

    try{
        // Get DB Object
        $db = new db();
        // Connect
        $db = $db->connect();

        $stmt = $db->prepare($sql);
        $stmt->execute();
        $db = null;
        echo '{"notice": {"text": "Customer Deleted"}';
    } catch(PDOException $e){
        echo '{"error": {"text": '.$e->getMessage().'}';
    }
});


function get_impin_code($len, $chars = '0123456789', $chars2 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') {
			$string = '';
			for ($i = 0; $i < $len; $i++)
			{
				if ($i % 2 != 0) {
					$pos = rand(0, strlen($chars)-1);
					$string .= $chars{$pos};
				}else {
					$pos = rand(0, strlen($chars2)-1);
					$string .= $chars2{$pos};
				}
			}
			return $string;
	}




