// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

Turbo.StreamActions.update_whichever = function() {

    // need an "alt" attribute to be provided
    const alt = this.getAttribute("alt")

    // try to query the primary target
    let primary_target = document.querySelector(this.target);
    let actual_target = null;

    // if primary target is in DOM, this is truthy
    if (primary_target) {
        // Set primary target as actual target
        actual_target = primary_target
    } else {
        // otherwise, use the alt target; if not present, nothing happens
        actual_target = document.querySelector(alt);
    }

    debugger;
    console.log(actual_target, alt, "templateContent: " + this.templateContent);
    
    // perform the default turbo_stream update on whichever target was first found
    actual_target.replaceChildren(this.templateContent);
}