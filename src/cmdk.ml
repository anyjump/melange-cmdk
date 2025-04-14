module Root = struct
  external make
    :  ?children:React.element
    -> ?className:string
    -> ?label:string
    -> ?shouldFilter:bool
    -> ?filter:(string -> string -> string array option -> float)
    -> ?defaultValue:string
    -> ?value:string
    -> ?onValueChange:(string -> unit)
    -> ?loop:bool
    -> ?disablePointerSelection:bool
    -> ?vimBindings:bool
    -> ?ref:ReactDOM.domRef
    -> (* DOM props *)
       ?id:string
    -> ?style:ReactDOM.style
    -> ?onKeyDown:(React.Event.Keyboard.t -> unit)
    -> ?onKeyUp:(React.Event.Keyboard.t -> unit)
    -> ?onFocus:(React.Event.Focus.t -> unit)
    -> ?onBlur:(React.Event.Focus.t -> unit)
    -> ?role:string
    -> ?ariaLabel:string
    -> unit
    -> React.element
    = "Command"
  [@@react.component] [@@mel.module "cmdk"]
end

module List = struct
  external make
    :  ?children:React.element
    -> ?className:string
    -> ?label:string
    -> ?ref:ReactDOM.domRef
    -> (* DOM props *)
       ?id:string
    -> ?style:ReactDOM.style
    -> ?role:string
    -> ?ariaLabel:string
    -> unit
    -> React.element
    = "List"
  [@@react.component] [@@mel.module "cmdk"] [@@mel.scope "Command"]
end

module Item = struct
  external make
    :  ?children:React.element
    -> ?className:string
    -> ?disabled:bool
    -> ?onSelect:(string -> unit)
    -> ?value:string
    -> ?keywords:string array
    -> ?forceMount:bool
    -> ?ref:ReactDOM.domRef
    -> (* DOM props *)
       ?id:string
    -> ?style:ReactDOM.style
    -> ?onKeyDown:(React.Event.Keyboard.t -> unit)
    -> ?onKeyUp:(React.Event.Keyboard.t -> unit)
    -> ?onFocus:(React.Event.Focus.t -> unit)
    -> ?onBlur:(React.Event.Focus.t -> unit)
    -> ?onClick:(React.Event.Mouse.t -> unit)
    -> ?role:string
    -> ?ariaLabel:string
    -> ?ariaSelected:bool
    -> ?ariaDisabled:bool
    -> unit
    -> React.element
    = "Item"
  [@@react.component] [@@mel.module "cmdk"] [@@mel.scope "Command"]
end

module Input = struct
  external make
    :  ?children:React.element
    -> ?className:string
    -> ?value:string
    -> ?onValueChange:(string -> unit)
    -> ?ref:ReactDOM.domRef
    -> (* DOM props *)
       ?id:string
    -> ?style:ReactDOM.style
    -> ?placeholder:string
    -> ?onKeyDown:(React.Event.Keyboard.t -> unit)
    -> ?onKeyUp:(React.Event.Keyboard.t -> unit)
    -> ?onFocus:(React.Event.Focus.t -> unit)
    -> ?onBlur:(React.Event.Focus.t -> unit)
    -> ?role:string
    -> ?ariaLabel:string
    -> ?ariaExpanded:bool
    -> ?autoComplete:string
    -> ?autoFocus:bool
    -> unit
    -> React.element
    = "Input"
  [@@react.component] [@@mel.module "cmdk"] [@@mel.scope "Command"]
end

module Group = struct
  external make
    :  ?children:React.element
    -> ?className:string
    -> ?heading:React.element
    -> ?value:string
    -> ?forceMount:bool
    -> ?ref:ReactDOM.domRef
    -> (* DOM props *)
       ?id:string
    -> ?style:ReactDOM.style
    -> ?role:string
    -> ?ariaLabel:string
    -> ?hidden:bool
    -> unit
    -> React.element
    = "Group"
  [@@react.component] [@@mel.module "cmdk"] [@@mel.scope "Command"]
end

module Separator = struct
  external make
    :  ?className:string
    -> ?alwaysRender:bool
    -> ?ref:ReactDOM.domRef
    -> (* DOM props *)
       ?id:string
    -> ?style:ReactDOM.style
    -> ?role:string
    -> ?ariaLabel:string
    -> unit
    -> React.element
    = "Separator"
  [@@react.component] [@@mel.module "cmdk"] [@@mel.scope "Command"]
end

module Empty = struct
  external make
    :  ?children:React.element
    -> ?className:string
    -> ?ref:ReactDOM.domRef
    -> (* DOM props *)
       ?id:string
    -> ?style:ReactDOM.style
    -> ?role:string
    -> ?ariaLabel:string
    -> unit
    -> React.element
    = "Empty"
  [@@react.component] [@@mel.module "cmdk"] [@@mel.scope "Command"]
end

module Loading = struct
  external make
    :  ?children:React.element
    -> ?className:string
    -> ?progress:float
    -> ?label:string
    -> ?ref:ReactDOM.domRef
    -> (* DOM props *)
       ?id:string
    -> ?style:ReactDOM.style
    -> ?role:string
    -> ?ariaLabel:string
    -> ?ariaValueNow:float
    -> ?ariaValueMin:float
    -> ?ariaValueMax:float
    -> unit
    -> React.element
    = "Loading"
  [@@react.component] [@@mel.module "cmdk"] [@@mel.scope "Command"]
end

module Dialog = struct
  external make
    :  ?children:React.element
    -> ?className:string
    -> ?overlayClassName:string
    -> ?contentClassName:string
    -> ?container:Dom.element
    -> ?open_:(bool[@mel.as "open"])
    -> ?onOpenChange:(bool -> unit)
    -> ?label:string
    -> ?ref:ReactDOM.domRef
    -> (* DOM props *)
       ?id:string
    -> ?style:ReactDOM.style
    -> ?role:string
    -> ?ariaLabel:string
    -> unit
    -> React.element
    = "Dialog"
  [@@react.component] [@@mel.module "cmdk"] [@@mel.scope "Command"]
end

type item =
  { id : string
  ; value : string
  ; keywords : string list
  ; score : float
  ; disabled : bool
  ; group_id : string option
  }

type group =
  { id : string
  ; heading : string option
  ; items : string list
  ; force_mount : bool
  }

type command_state =
  { search : string
  ; selected : string option
  ; filtered_items : item list
  ; groups : group list
  }

external useCommandState : unit -> command_state = "useCommandState" [@@mel.module "cmdk"]

external defaultFilter
  :  string
  -> string
  -> string array option
  -> float
  = "defaultFilter"
[@@mel.module "cmdk"]
