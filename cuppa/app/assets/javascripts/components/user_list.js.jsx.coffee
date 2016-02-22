{button, a, div, ul, li, input, form} = React.DOM

@UserList = React.createClass
  getInitialState: ->
    users: @props.users

  render: ->
    users = @state.users
    div {},
      
      div className: 'submit',
        form { 
          onSubmit: @handle_submit
          className: 'form'},
          input {
            type: 'text'
            name: 'userstuff'
            placeholder: 'Name'
            id: 'user_name' }
          input {
            type: 'text'
            name: 'userstuff'
            placeholder: 'Email'
            id: 'user_email' }
          input { 
            type: 'submit'
            className: "button",
            onClick: @handle_submit},

        div {},
        @handle_getStuff
          
            if users.length > 0
              for user in users
                  div className: 'user',
                    div className: 'name',
                      'Name: ' + user.name
                    div className: 'email',
                      'Email: ' + user.email

            
  handle_submit: (e) ->
    e.preventDefault()
    name = $('#user_name').val()
    email = $('#user_email').val()
    if name.length > 0
      $.ajax(
        url: "/users.json"
        data: {user: {name: name, email: email}}
        type: "POST"
      ).done (user) =>
        $('#user_name').val('')
        $('#user_email').val('')
        @setState users: (@state.users.concat [user])

  handle_getStuff: ->
    $.ajax(
      url: "/users.json"
      type: "GET"
    ).done (users) =>
      @setState users: users     