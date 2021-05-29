class AppliesController < ApplicationController


def index
    @applies = policy_scope(Apply).order(id: :desc)
end
