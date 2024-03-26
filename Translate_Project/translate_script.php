<!DOCTYPE html>
<html>
<head>
    <title>Language Translator In PHP</title>
</head>
<body>
    <h1>Language Translator</h1>
    <form method="POST">
        <label for="text">Enter Text:</label>
        <input type="text" name="text" id="text" required>
        <br><br>
        <label for="source">Source Language:</label>
        <select name="source" id="source">
            <option value="en">English</option>
            <option value="fr">French</option>
            <option value="es">Spanish</option>
            <option value="de">German</option>
        </select>
        <br><br>
        <label for="target">Target Language:</label>
        <select name="target" id="target">
            <option value="en">English</option>
            <option value="fr">French</option>
            <option value="es">Spanish</option>
            <option value="de">German</option>
        </select>
        <br><br>
        <input type="submit" value="Translate">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $text = $_POST["text"];
        $source = $_POST["source"];
        $target = $_POST["target"];

        $url = "https://api.mymemory.translated.net/get?q=" . urlencode($text) . "&langpair=" . $source . "|" . $target;

        $response = file_get_contents($url);
        $translated = json_decode($response, true);

        if ($translated && isset($translated['responseData']['translatedText'])) {
            echo "<h2>Translated Text:</h2>";
            echo "<p>" . $translated['responseData']['translatedText'] . "</p>";
        } else {
            echo "<h2>Error occurred during translation.</h2>";
        } 
    }
    ?>

</body>
  <!-- Created By LEVIDOC -->
</html>

