<?php namespace Mdeko\Api\Controllers;

use Backend\Classes\Controller;
use BackendMenu;


use Illuminate\Http\Request;
use Event;
 

class Order extends Controller
{
    public $implement = [        'Backend\Behaviors\ListController',        'Backend\Behaviors\FormController',        'Backend\Behaviors\ReorderController'    ];
    
    public $listConfig = 'config_list.yaml';
    public $formConfig = 'config_form.yaml';
    public $reorderConfig = 'config_reorder.yaml';

    public function __construct()
    {
        parent::__construct();
        BackendMenu::setContext('Mdeko.Api', 'main-menu-item3', 'side-menu-item2');
    }


		public function handleNotification(Request $request)
    {
			$secretSeed = "8xFhp57)W6p3Bp=rKZB";  
			$id = $request->input('id');
			$sum = $request->input('sum');
			$clientid = $request->input('clientid');
			$orderid = $request->input('orderid');
			$key = $request->input('key');

        // Проверка цифровой подписи
        $expectedKey = md5($id . number_format($sum, 2, ".", "") . $clientid . $orderid . $secretSeed);
        if ($key !== $expectedKey) {
            return response()->json(['error' => 'Hash mismatch'], 400);
        }
				try {
					$this->validate($request, [
							'service_name' => 'required',
							'client_phone' => 'required',
							'client_email' => 'required',
							'sum' => 'required',
							'orderid' => 'required',
							'clientid' => 'required',

					]);
			} catch (ValidationException $e) {
					return response()->json(['error' => $e->errors()], 400);
			}
// оюязательные поля
				$order = new OrderModel();
				$order->service_name = $serviceName;
				$order->client_email = $clientEmail;
        $order->client_phone = $clientPhone;
				$order->sum = $sum;
				$order->orderid = $orderid;
        $order->clientid = $clientid;
// сам должен получить
        $order->key = $key;
        $order->ps_id = $psId;
// не обяхательные 
        $order->batch_date = $batchDate;
        $order->fop_receipt_key = $fopReceiptKey;
        $order->bank_id = $bankId;
        $order->card_number = $cardNumber;
        $order->card_holder = $cardHolder;
        $order->card_expiry = $cardExpiry;
        $order->status = $status;
        $order->item_id = $itemId;
        $order->message = $message;
        $order->city = $city;
        $order->street = $street;
        $order->houseNumber = $houseNumber;
        $order->online_payment = $onlinePayment;
        $order->delivery = $delivery;

 
        $order->save();


				Event::fire('paykeeper.notificationReceived', $request->all());
				
// В каком-то подходящем месте (например, в вашем плагине или модуле)
// Event::listen('paykeeper.notificationReceived', function ($data) {
	// Вызов вашего слушателя или выполнение дополнительных действий
	// Например, отправка уведомления, обновление статуса заказа и т.д.
// });
        // Отправить ответ Paykeeper
        $responseHash = md5($id . $secretSeed);
        return response("OK {$responseHash}");

        // // Верните ответ, который ожидает Paykeeper
        // return response()->json(['success' => true]);
    }
}
