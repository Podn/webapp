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

function disabled(el, disabled) { 
    if (disabled) {
        el.setAttribute('disabled', true);
    } else {
        el.removeAttribute('disabled');
    }
}

let currentInformationPage = 0;

function submitInformation() {
    const post_data = {};
    post_data['services'] = Object.keys(selected).join(', ');
    post_data['rss'] = $('#rss').val();
    post_data['details'] = $('#details').val();
    $.post( "/users/information", post_data)
      .done(function( data ) {
        if (data['status'] === 'success') {
            window.location.replace('/waitlisted'); 
        }
      });
}

function informationState(forward) {
    const button = forward ? $('#information-forward') : $('#information-back');
    if (button[0].getAttribute('disabled')) return;
    const pages = $('.information-page');
    if (forward) {
        currentInformationPage++;
        if (currentInformationPage === pages.length) {
            submitInformation();
            return;
        }
        currentInformationPage = Math.min(pages.length - 1, currentInformationPage);
    } else {
        currentInformationPage--;
        currentInformationPage = Math.max(0, currentInformationPage);
    }
    for (let i = 0; i < pages.length; ++i) {
        if (i === currentInformationPage) {
            $(pages[i]).show();
        } else {
            $(pages[i]).hide();
        }
    }
    updateInformationButtons()
}

function updateInformationButtons() {
    const f_button = $('#information-forward');
    const b_button = $('#information-back');
    if (!f_button[0] || !b_button[0]) return;
    switch  (currentInformationPage) {
        case 0:
            disabled(b_button[0], true);
            disabled(f_button[0], Object.keys(selected).length === 0);
            f_button[0].textContent = 'Continue';
            break;
        case 1:
            f_button[0].textContent = 'Complete';
            disabled(b_button[0], false);
            disabled(f_button[0], false);
            break;
        default:
            console.error('unexpected page');
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
        updateInformationButtons();
    });
});
