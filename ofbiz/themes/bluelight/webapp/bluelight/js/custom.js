var DropDownMenu = (
  function(menuElement) {
    var menuTitle = menuElement.find("#app-navigation h2:first");
    menuElement.children().each(function(node){
      // if there is a submenu
      var submenu = jQuery(this).find("ul:first");

      if(submenu != null){
        // make sub-menu invisible
        submenu.hide();
        // toggle the visibility of the submenu
        if (menuTitle != null) {
          //menuTitle.click (function(){ submenu.css({'display': 'block'});});
          menuTitle.click (function(){submenu.toggle();});
        }
        //jQuery(this).click (function(){submenu.css({'display': 'block'});});
        jQuery(this).click (function(){submenu.toggle();});
      }
    });
  }
);