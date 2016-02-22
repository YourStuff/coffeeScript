# @cjsx React.DOM
{button,i, div, ul, li, input, form} = React.DOM

@ContactList = React.createClass
  getInitialState: ->
    contacts: @props.contacts
    search: ''

  render: ->

    div {},
      div {className: "row"},
        div {className: "col-lg-6"},
          input {
            onChange: @handle_search
            value: @state.search
            id: 'search' 
            placeholder: 'Search...' }
          i {className: 'search icon'}
      if contacts.length > 0
        for contact in contacts
          Contact
            contact: contact
            key: contact.id
            handle_delete: @handle_delete
      else
        div {className: "row"},
          "Nothing..."
      div {className: "col-lg-6"},
        form { onSubmit: @handle_submit},
          div {className: "input-group"},
            input {
              type: 'string'
              name: 'contact[fname]','contact[lname]'
              email: 'contact[email]'
              phone:'contact[phone]'
              placeholder: 'Task...'
              id: 'contact_name' }
            div {
              className: "btn btn-default btn-xs",
              onClick: @handle_submit},
              'Add'

  handle_submit: (e) ->
    e.preventDefault()
    name = $('#contact_name').val()
    if name.length > 0
      $.ajax(
         url: "/contacts.json"
         data: {contact: {fname: first name, lname: last name, email: email, phone: phone, street: street, city: city, state: state, done: false}}
         type: "POST"
      ).done (contact) =>
        $('#contact_name').val('')
        @setState contacts: (@state.contacts.concat [contact])

  handle_search: (e) ->
    @setState search: e.target.value

  handle_delete: ->
    $.ajax(
       url: "/contacts.json"
       type: "GET"
    ).done (contacts) =>
      @setState contacts: contacts
