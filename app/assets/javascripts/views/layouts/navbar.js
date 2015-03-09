ggDimSum.Views.LayoutsNavbar = Backbone.CompositeView.extend({
  template: JST['layouts/navbar'],

  initialize: function () {
    this.addUsersUl();
    this.addLoginModal();
    this.addSignupModal();

  },

  events: {
    'click a.login': 'showLoginModal',
    'click a.signup': 'showSignupModal',
    'click a.logout': 'logoutCurrentUser'
  },

  addUsersUl: function () {
    var userUlView = new ggDimSum.Views.LayoutsUserUl();
    this.addSubview('#navbar-user-collapse', userUlView);
  },

  addLoginModal: function () {
    var loginModalView = new ggDimSum.Views.AuthModal({ type: 'login' });
    this.addSubview('#login', loginModalView);
  },

  addSignupModal: function () {
    var signupModalView = new ggDimSum.Views.AuthModal({ type: 'signup' });
    this.addSubview('#signup', signupModalView);
  },

  showLoginModal: function (event) {
    this.$('#login-modal').modal('show');
    this._autoFocusFirstInput('#user_email');
  },

  showSignupModal: function (event) {
    this.$('#signup-modal').modal('show');
    this._autoFocusFirstInput('#user_first_name');
  },

  logoutCurrentUser: function (user) {
    // var $authToken = $( 'meta[name="csrf-token"]' ).attr( 'content' );
    // console.log($authToken.toString());
    // console.log("$authToken Before Logout");

    // console.log('gg.currentUser.attributes before Logout')
    // console.log(ggDimSum.currentUser.attributes);
    $.ajax({
      url: '/api/users/sign_out',
      type: 'DELETE',
      success: function (model, resp) {
        ggDimSum.currentUser.clear();
        // window.location = 'https://ggdimsum.herokuapp.com';
        // console.log('gg.currentUser.attributes after logout');
        // console.log(ggDimSum.currentUser.attributes);
        // window.location.reload(); old way of getting new csrf token
        // new way of updating csrf token after logging out session
        // var $authToken = $( 'meta[name="csrf-token"]').attr( 'content' );
        // console.log($authToken.toString());
        // console.log("authToken After Logout");
      }
    })
  },


  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();

    return this;
  },

  _autoFocusFirstInput: function (selector) {
    setTimeout(function () {
      $(selector).focus();
    }, 450);
  }
});
