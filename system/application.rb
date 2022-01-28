# frozen_string_literal: true

require 'dry/cli'
require 'dry/transaction'
require 'dry/transaction/operation'
require 'dry/struct'
require 'tty-prompt'
require 'ffaker'

require_relative 'container'