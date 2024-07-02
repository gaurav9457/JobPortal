<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.mySlides {
display: none;
}
img {
vertical-align: middle;
}


.slideshow-container {
  max-width: 1200px;
  position: relative;
  margin: auto;
  height:200px;
}


.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}


.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}


.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}


.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}
</style>
</head>
<body>
<div class="slideshow-container">

<div class="mySlides fade">
  <!-- <div class="numbertext">1 / 3</div> -->
  <img height=200px; src="https://fairviewchamber.com/wp-content/uploads/2023/02/Untitled-design-1024x384.png" style="width:100%">
  
  <!-- <div class="text">Caption Text</div> -->
</div>

<div class="mySlides fade">
 <!--  <div class="numbertext">2 / 3</div> -->
  <img height=200px; src="https://www.millersd.org/assets/images/uploads/jobs-en.png" style="width:100%">
  <!-- <div class="text">Caption Two</div> -->
</div>

<div class="mySlides fade">
  <!-- <div class="numbertext">3 / 3</div> -->
  <img height=200px; src="https://st2.depositphotos.com/3643473/6206/i/450/depositphotos_62060317-stock-illustration-person-with-megaphone-and-word.jpg" style="width:100%">
  <!-- <div class="text">Caption Three</div> -->
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); 
}
</script>
</body>
</html>