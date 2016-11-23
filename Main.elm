module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Time exposing (Time, second)


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


update msg model =
    case msg of
        Start ->
            { model | running = True }

        Stop ->
            { model | running = False }

        Reset ->
            { model | running = False }



-- SUBSCRIPTIONS
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
