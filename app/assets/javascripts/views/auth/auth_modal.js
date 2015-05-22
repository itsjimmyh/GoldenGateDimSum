ggDimSum.Views.AuthModal = Backbone.CompositeView.extend({
  loginTemplate: JST['auth/login_form'],
  signupTemplate: JST['auth/signup_form'],

  initialize: function (options) {
    this.type = options.type;
    if (this.type === 'login') {
      ggDimSum.loginModalView = this;
    } else {
      ggDimSum.signUpModalView = this;
    }
  },

  events: {
    'hidden.bs.modal': 'handleModalHide',
    'submit #login-form': 'handleLogin',
    'submit #signup-form': 'handleSignUp'
  },

  handleLogin: function (event) {
    event.preventDefault();
    var userParams = $(event.target).serializeJSON();
    var that = this;

    $.ajax({
      url: 'api/users/sign_in',
      type: 'POST',
      data: userParams,
      success: function (model, resp) {
        that.$('#login-modal').modal('hide');
        that.handleModalHide();
        that.loginCurrentUser(model);
      },
      error: function (model, resp) {
        that.addFlashErrors([model.responseJSON.message]);
      }
    });
  },

  handleSignUp: function (event) {
    event.preventDefault();
    var userSignupParams = $(event.target).serializeJSON();
    var user = new ggDimSum.Models.User(userSignupParams);
    var that = this;

    user.save({}, {
      success: function (model, resp) {
        that.$('#signup-modal').modal('hide');
        that.loginCurrentUser(model.attributes);
      },
      error: function (model, resp) {
        that.addFlashErrors(resp.responseJSON);
      }
    });
  },

  handleModalHide: function () {
    this.$('#flash-message').empty();
    this.$('input[type=text]').val('');
    this.$('input[type=password]').val('');
  },

  loginCurrentUser: function (user) {
    ggDimSum.currentUser.set(user);
  },

  addFlashErrors: function (errors) {
    var flashMessageView = new ggDimSum.Views.LayoutsFlashMessage({
      messages: errors,
      flashClass: 'alert-danger'
    });
    // this.$('#flash-message').html();
    this.$('#flash-message').html(flashMessageView.render().$el);
    this.$('input[type=password]').val('');
  },

  render: function () {
    var templateView = this.type == 'login' ? this.loginTemplate : this.signupTemplate;
    var renderedContent = templateView();
    this.$el.html(renderedContent);

    return this;
  }

});
