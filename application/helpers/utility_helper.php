<?php

/*
 * Common function by Harish
 */

require 'vendor/autoload.php';
use Mailgun\Mailgun;

function createSessionId($salt) {
    mt_srand((double) microtime() * 10000); //optional for php 4.2.0 and up.
    $charid = strtoupper(md5(uniqid(rand(), true)));
    $uuid = substr($charid, 0, 8) . substr($charid, 8, 4) . substr($charid, 12, 4) . substr($charid, 16, 4) . substr($charid, 20, 12) . gethostname();
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    if (isset($_COOKIE['scumd']) && $_COOKIE['scumd'] != '') {
        $user_id = base64_decode($_COOKIE['scumd']);
        $uuid = $uuid . $user_agent . $user_id;
    } else {
        $uuid = $uuid . $user_agent;
    }
    return base64_encode(md5($uuid) . md5($salt));
}

function postCurl($url, $params, $access_token) {
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type:application/json', 'Authorization:Bearer ' . $access_token . ''));
    curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($params));
    $jsonResult = curl_exec($curl);
    if (curl_errno($curl)) {
        curl_close($curl);
        return FALSE;
    }
    curl_close($curl);
    return $jsonResult;
}

function getCurl($url, $access_token) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json', 'Authorization:Bearer ' . $access_token . ''));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $data = curl_exec($ch);
    if (curl_errno($ch)) {
        curl_close($ch);
        return FALSE;
    }
    curl_close($ch);
    return $data;
}

function checkMobileClient() {
    $useragent = $_SERVER['HTTP_USER_AGENT'];
    if (preg_match('/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i', $useragent) || preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i', substr($useragent, 0, 4))) {
        return true;
    } else {
        return false;
    }
}

function getSiteHost() {
    $protocol = 'http://';
    if (isset($_SERVER['HTTPS']) && !empty($_SERVER['HTTPS'])) {
        $protocol = 'https://';
    }
    if (preg_match('/localhost/', $_SERVER['HTTP_HOST'])) {
        return $protocol . "localhost" . '/' . 'store' . '/';
    } else if (preg_match('/test/', $_SERVER['HTTP_HOST'])) {
        return $protocol . $_SERVER['HTTP_HOST'] . '/' . 'test' . '/';
    } else {
        return '';
    }
}

function uploadFile() {
    $target_dir = getSiteHost() . "assets/images/prescription/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $message = "";
    $filepath="";
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    // Check if image file is a actual image or fake image
    if (isset($_POST["submit"])) {
        $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
        if ($check !== false) {
            $message = "File is an image - " . $check["mime"] . ".";
            $uploadOk = 1;
        } else {
            $message = "File is not an image.";
            $uploadOk = 0;
        }
    }
    // Check if file already exists
    if (file_exists($target_file)) {
        $message = "Sorry, file already exists.";
        $uploadOk = 0;
    }
    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 200000) {
        $message = "Sorry, your file is too large.";
        $uploadOk = 0;
    }
    // Allow certain file formats
    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" && $imageFileType != "pdf") {
        $message = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        $message = "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            $filepath = basename($_FILES["fileToUpload"]["name"]);
        } else {
            $message = "Sorry, there was an error uploading your file.";
        }
    }
    return array("flag" => $uploadOk,"file" => $filepath , 'message' => $message);
}

function sendInstantEmail($from,$to,$subject,$description){
        
        # Instantiate the client.
        $mgClient = new Mailgun('9b******fe');
        $domain = "sand****4a.mailgun.org";

        # Make the call to the client.
        $result = $mgClient->sendMessage($domain, array(
            'from'    => $from,
            'to'      => $to,
            'subject' => $subject,
            'text'    => $description
        ));
}
