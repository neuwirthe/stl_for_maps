# Koordinatentransformation

aut2wgs <- function(v,v2=NULL){
  if(is.null(v2)){  
    xy <- cbind(x=v[1],y=v[2]) 
  } else {
    xy <- cbind(x=v,y=v2)  
  }
  p   <- vect(xy, type = "point", crs = "EPSG:31256")
  p_wgs <- project(p, "EPSG:4326")
  p_wgs |> ext() -> eee
  c(xmin(eee),
    ymin(eee)
  )
}


wgs2aut <- function(v,v2=NULL){
  if(is.null(v2)){  
    xy <- cbind(x=v[1],y=v[2]) 
  } else {
    xy <- cbind(x=v,y=v2)  
  }
  p   <- vect(xy, type = "point", crs = "EPSG:4326")
  p_wgs <- project(p, "EPSG:31256")
  p_wgs |> ext() -> eee
  c(xmin(eee),
    ymin(eee)
  )
}

