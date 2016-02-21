# @cjsx React.DOM

{a, i, label, div, ul, li, input} = React.DOM

@Contact = React.createClass
  getInitialState: ->
    contact: @props.contact

  render: ->
    div {className: 'ui attached segment'},
      div {className: "ui ten columns grid" },
        div {className: "left floated nine wide column" },
          div {className: 'ui big checkbox input'},
            input {
              onChange: @handle_change,
              type: 'checkbox',
              id: @state.contact.id,
              name: @state.contact.id,
              checked: (@state.contact.done ? 'checked' : '') }
            label {htmlFor: @state.contact.id},
              @state.contact.name
        div {className: "right floated column" },
          i {
            className: 'red remove circle large link icon',
            onClick: @delete_me }

  clean_object: (o) ->
    for key in ['id', 'created_at', 'updated_at']
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
