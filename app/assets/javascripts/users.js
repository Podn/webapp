const selected = {};

function toggleClass(element, class_name, add) {
    const e = $(element);
    if (add && !e.hasClass(class_name)) {
        e.addClass(class_name);
    }
    if (!add && e.hasClass(class_name)) {
        e.removeClass(class_name);
    }
}

document.addEventListener("DOMContentLoaded", function(event) { 
    $('.selectable').click(e => {
        const target = e.currentTarget;
        if (!target) {
            console.error("No target on selectable click");
            return;
        }
        const key = target.getAttribute('data-name');
        const value = target.getAttribute('data-value');
        if (selected[key]) {
            toggleClass(target, "selected", false);
            delete selected[key];
        } else {
            toggleClass(target, "selected", true);
            selected[key] = value;
        }
    });
});
