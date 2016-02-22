# @cjsx React.DOM

{a, i, label, div, ul, li, input} = React.DOM

@Contact = React.createClass
  getInitialState: ->
    contact: @props.contact

  render: ->
    div {className: "row"},
      div {className: "col-lg-6" },
        div {className: "input-group" },
          div {className: "input-group-addon"},
            input {
              onChange: @handle_change,
              type: 'checkbox',
              id: @state.contact.id,
              fname: @state.contact.fname,
              lname: @state.contact.lname,
              email: @state.contact.email,
              phone: @state.contact.phone,
              checked: (@state.contact.done ? 'checked' : '') }
            label {htmlFor: @state.contact.id},
              @state.contact.fname,
              @state.contact.lname,
              @state.contact.email,
              @state.contact.phone
        span {className: "label label-success" },
          i {
            className: "label label-danger",
            onClick: @delete_me }

  clean_object: (o) ->
    for key in ['id', 'fname', 'lname', 'email', 'phone']
      delete o[key]
    return o

  handle_change: (e) ->
    contact = @state.contact
    contact.done = e.target.checked
    
    $.ajax(
       url: "/contacts/#{@state.contact.id}.json"
       data: {contact: @clean_object(contact)}
       type: "PUT"
    ).done (contact) =>
      @setState contact: contact

  delete_me: ->
    $.ajax(
       url: "/contacts/#{@state.contact.id}.json"
       type: "DELETE"
    ).done (contact) =>
      @props.handle_delete()
