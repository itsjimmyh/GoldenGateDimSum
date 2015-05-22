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
    this.$('button.navbar-toggle').click();
    this.$('#signup-modal').modal('hide');
    this.$('#login-modal').modal('show');
    this._autoFocusFirstInput('#user_email');
  },

  showSignupModal: function (event) {
    this.$('button.navbar-toggle').click();
    this.$('#login-modal').modal('hide');
    this.$('#signup-modal').modal('show');
    this._autoFocusFirstInput('#user_first_name');
  },

  logoutCurrentUser: function (user) {
    $.ajax({
      url: '/api/users/sign_out',
      type: 'DELETE',
      success: function (model, resp) {
        ggDimSum.currentUser.clear();
      }
    });
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
