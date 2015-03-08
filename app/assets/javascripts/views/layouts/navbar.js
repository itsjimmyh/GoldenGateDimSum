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
  },

  showSignupModal: function (event) {
    this.$('#signup-modal').modal('show');
  },

  logoutCurrentUser: function (user) {
    // var $authToken = $( 'meta[name="csrf-token"]' ).attr( 'content' );
    // console.log($authToken.toString());
    // console.log("authToken Before");
    $.ajax({
      url: '/api/users/sign_out',
      type: 'DELETE',
      success: function (model, resp) {
        ggDimSum.currentUser.clear();
        // window.location.reload(); old way of getting new csrf token
        // new way of updating csrf token after logging out session
        // var $authToken = $( 'meta[name="csrf-token"]').attr( 'content' );
        // console.log($authToken.toString());
        // console.log("authToken After");
      }
    })
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();

    return this;
  }
});
