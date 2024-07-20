# frozen_string_literal: true

module Fsacars
  class PositionReportsController < ApplicationController
    def index
      render plain: "RXOK"
    end
  end
end