require 'cgi'
module Paymo
  class Builder

    def initialize()
    end

    def find_by(args)
      @find_by_filter = args
      self
    end

    def member(args)
      @member = args
      self
    end

    def where(args)
      @where_filter = args
      self
    end

    def include(*args)
      @include_filter = args.flatten
      self
    end

    def render
      build = []
      if @where_filter
        build << "where=#{CGI.escape(@where_filter)}"
      end
      if @include_filter
        build << "include=#{@include_filter.join(',')}"
      end
      [("/#{@member}" if @member), '?', build.join("&")].join
    end
  end
end
