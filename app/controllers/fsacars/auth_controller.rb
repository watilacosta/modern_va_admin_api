# frozen_string_literal: true

module Fsacars
  class AuthController < ApplicationController
    # $username = $_GET['user']; //entered by user in fsACARS
    # $userpass = $_GET['pass']; //entered by user in fsACARS
    # $auth     = $_GET['auth']; //this is the password on line 5 of serverconfig.txt
    # $version  = $_GET['ver'];  //version of fsACARS
    # $planelat = $_GET['lat'];  //latitude, decimal degrees
    # $planelon = $_GET['lon'];  //longitude, decimal degrees
    # $aircraft = $_GET['eqpt']; //aircraft per titleline
    def index
      render plain: valid_required_params? ? 'USEROK' : 'NOUSR'
    end

    private

    def valid_required_params?
      !params
        .values_at(:auth, :user, :pass)
        .any?(&:empty?)
    end
  end
end
