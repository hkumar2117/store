<?php
require 'vendor/autoload.php';
use Mailgun\Mailgun;

$from ="harish@emedslab.com";
$to = "hhyadav94@gmail.com";
$subject = "Hello";
$content = "This is email description";

sendInstantEmail($from,$to,$subject,$content);
function sendInstantEmail($from,$to,$subject,$description){
        
        # Instantiate the client.
        $mgClient = new Mailgun('9b243c3eb89ee4d2ed66761c8834cf4f-b0aac6d0-504d29fe');
        $domain = "sandbox5c6e45ae52744668bae0fe40e842314a.mailgun.org";

        # Make the call to the client.
        $result = $mgClient->sendMessage($domain, array(
            'from'    => $from,
            'to'      => $to,
            'subject' => $subject,
            'text'    => $description
        ));
}
