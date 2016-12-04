<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Demo</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="js/my_code.js"></script>
</head>
<body>
<script>
$(document).ready(function() {

  $("p").hide();

  $("h1").click(function() {
    $(this).next().slideToggle(300);
  });

});

</script>

 <h1>Heading one</h1>
 <p>This is just some text for heading 1</p>

 <h1>Heading two</h1>
 <p>This is just some text for heading 2</p>

 <h1>Heading three</h1>
 <p>This is just some text for heading 3</p>

</body>
</html>