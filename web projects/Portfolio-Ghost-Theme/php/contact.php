<?php 
//Receive The Inputs 
$name = $_POST['name']; 
$email = $_POST['email']; 
$contact = $_POST['contat']; 

// Create an array with the form data
$contactData = array(
    'name' => $name,
    'email' => $email,
    'phone' => $phone
);

//Specify The JSON File Location 
$file_location = 'data_storage\contacts.json'; 

// Read existing JSON data from the data storage
$contacts = json_decode(file_get_contents($file_location), true);

// Add new contact details to the contacts array
$contacts[] = $contactData;

// Write the updated JSON data back to the data storage
file_put_contents($file_location, json_encode($contacts, JSON_PRETTY_PRINT));

header("Location: ../index.html"); 
//Redirect To Index Page 

?>