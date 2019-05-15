const APIUtil = require('./api_util.js');

class FollowToggle {
    constructor($el) {
        this.$el = $($el);
        this.followState = this.$el.data('initial-follow-state');
        this.userId = this.$el.data('user-id');
        this.render();
        this.handleClick();
    }

    render (){
        if(this.followState === false){
            this.$el.text('Follow!');
        } else if (this.followState === true) {
            this.$el.text('Unfollow!');
        } else if(this.followState === 'disabled') {
            this.$el.disabled();
        }

    }
    handleClick() {
        const followSuccessCB = (response) => {
            this.followState = true;
            this.render();
        };

        const unfollowSuccessCB = (response) => {
            this.followState = false;
            this.render();
        };

        this.$el.on('click', e => {
            e.preventDefault();
            if(this.followState === false) {
                this.followState = 'disabled';
                this.render();
                APIUtil.followUser(this.userId).then(followSuccessCB);
            } else {
                this.followState = 'disabled';
                this.render();
                APIUtil.unfollowUser(this.userId).then(unfollowSuccessCB);
            }
           
         
        });
        
    }
}

module.exports = FollowToggle;