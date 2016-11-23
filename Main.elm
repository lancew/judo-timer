module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Time exposing (..)


main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = model
        }



-- Init


init =
    ( False, 0 )



-- MODEL


type alias Model =
    { running : Bool
    , remaining : Int
    }


model =
    Model False 60



-- UPDATE


type Msg
    = Start
    | Stop
    | Reset
    | Tick Time


update msg model =
    case msg of
        Start ->
            { model | running = True }

        Stop ->
            { model | running = False }

        Reset ->
            { model | running = False, remaining = 30 }

        Tick newTime ->
                { model | remaining = 100 }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.running of
        True ->
            Time.every second Tick

        False ->
            Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text (toString model.remaining) ]
        , p [] [ text (toString model.running) ]
        , button [ onClick Start ] [ text "Start" ]
        , button [ onClick Stop ] [ text "Stop" ]
        , button [ onClick Reset ] [ text "Reset" ]
        ]
