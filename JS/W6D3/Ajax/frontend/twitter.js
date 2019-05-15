const FollowToggle = require('./follow_toggle.js');

$( () => {
    const $el = $('.follow-toggle');
    $el.each((index, el) => new FollowToggle(el));
});










