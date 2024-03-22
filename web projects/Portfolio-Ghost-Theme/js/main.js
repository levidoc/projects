//const intro_text = 'Hello, and welcome to my portfolio! My name is Hardy Mazibeli, and I am thrilled to share with you my work and accomplishments. This portfolio showcases my skills, experience, and projects in Web development, Software development and Programming.';
const duration = 50; 
const text_container = document.getElementById('text_container'); 
const intro_text = text_container.innerHTML; 

text_container.innerHTML = ""; 

let index = 0;

function typewriter_intro() {
  if (index < intro_text.length) {
    text_container.innerHTML += intro_text.charAt(index);
    index++;
    setTimeout(typewriter_intro, duration);
  }
}

// Start the animation
typewriter_intro();


const about_duration = 60; 
const about_text = document.getElementById('about_text'); 
const about_data = about_text.innerHTML; 

about_text.innerHTML = null; 

let about_index = 0;

function typewriter_about() {
  if (about_index < about_data.length) {
    about_text.innerHTML += about_data.charAt(about_index);
    about_index++;
    setTimeout(typewriter_about, about_duration);
  }
}

// Start the animation
typewriter_about();


function toggle_menu(){
    let container = document.getElementById('mobile_menu'); 

    if (container.style.display == "none"){
        container.style.display = "block"; 
    }else{
        container.style.display = "none";
    }
}
