(function($) {
  'use strict';
  $(function() {
    $('.file-upload-browse').on('click', function() {
      var file = $(this).parent().parent().parent().find('.file-upload-default');
      file.trigger('click');
    });
    $('.file-upload-default').on('change', function() {
      $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
    });
  });
})(jQuery);



//SCRIPT for img displaying

  function displayImage(event) {
      const fileInput = event.target;
      const imageDisplay = document.getElementById('imageDisplay');
      const img  =document.getElementById('profile-img');
      if (fileInput.files && fileInput.files[0]) {
          const reader = new FileReader();
  
          reader.onload = function(e) {
              const imageUrl = e.target.result;
             
             //  Create an image element
             // const imgElement = document.createElement('img');
              //imgElement.src = imageUrl;
              //imgElement.style.width = '250px';
              //imgElement.style.height = '350px';
              //imgElement.style='border-radius:100%';
              //imgElement.style = 'max-width: 250px';
              
              // Display the image
              imageDisplay.innerHTML = ''; // Clear previous image
             
              imageDisplay.innerHTML=`<img src='${imageUrl}' alt="DP"   style="width: 250px; height: 250px;">`;
          };
  
          // Read the image file as a data URL
          reader.readAsDataURL(fileInput.files[0]);
      }
  }
