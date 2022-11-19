function w = UpdateInertiaWeight(w, wMin, beta)
    if w == wMin
        return
    end
    
    w = w * beta;
    if w < wMin
        w = wMin;
    end
end

