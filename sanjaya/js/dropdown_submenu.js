
  var toggleButtons = document.querySelectorAll('.dropdown-submenu-toggle');

  // Add click event listener to toggle buttons
  toggleButtons.forEach(function(button) {
      button.addEventListener('click', function(event) {
        event.stopPropagation();
        var submenu = button.nextElementSibling;
        submenu.classList.toggle('d-block');
      });
  });

  // Close submenus when clicked outside
  document.addEventListener('click', function(event) {
    toggleButtons.forEach(function(button) {
          var submenu = button.nextElementSibling;
          if (!submenu.contains(event.target)) {
            submenu.classList.remove('d-block');
          }
    });
  });