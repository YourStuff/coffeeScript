# @cjsx React.DOM
{button,i, div, ul, li, input, form} = React.DOM

@ContactList = React.createClass
  getInitialState: ->
    contacts: @props.contacts
    search: ''

  render: ->
    contacts = @state.contacts
    search_string = @state.search.trim().toLowerCase()

    if search_string.length > 0
      contacts = contacts.filter (contact) ->
        contact.name.trim().toLowerCase().match(search_string)

    div {},
      div {className: "ui top attached segment"},
        div {className: "ui icon fluid input"},
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
        div {className: 'ui attached segment'},
          "Nothing..."
      div {className: "ui botoom attached segment"},
        form { onSubmit: @handle_submit},
          div {className: "ui action fluid input"},
            input {
              type: 'text'
              name: 'contact[name]'
              placeholder: 'Task...'
              id: 'contact_name' }
            div {
              className: 'ui teal left labeled button',
              onClick: @handle_submit},
              'Add'

  handle_submit: (e) ->
    e.preventDefault()
    name = $('#contact_name').val()
    if name.length > 0
      $.ajax(
         url: "/contacts.json"
         data: {contact: {name: name, done: false}}
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
