class String

  def truncate
    max_size = 10 * 3

    if self.size > max_size
      return self[0..max_size-3] + "…"
    else
      self
    end
  end

end