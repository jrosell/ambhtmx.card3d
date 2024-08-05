# remotes::install_github("jrosell/ambhtmx", force = TRUE)
library(ambhtmx)
# devtools::load_all()

card_3d_demo <- \() {  
  card <- "card"
  tryCatch({
      # Original python code credit: https://fastht.ml/
      # Design credit: https://codepen.io/markmiro/pen/wbqMPa
      bgurl <- "https://ucarecdn.com/35a0e8a7-fcc5-48af-8a3f-70bb96ff5c48/-/preview/750x1000/"
      card_styles <- "font-family: 'Arial Black', 'Arial Bold', Gadget, sans-serif; perspective: 1500px;"
      card_3d <- \(text, bgurl, amt, left_align) {
        align <- ifelse(left_align, 'left', 'right')
        scr <- script_from_js_tpl('card3d.js', amt = amt)	      
        sty <- style_from_css_tpl(
          'card3d.css', bgurl = glue('url({bgurl})'), align = align
        )   
        div(text, div(), scr, sty, align = align)
      }
      card <- card_3d("Mouseover me", bgurl, amt = 1.5, left_align = T)
    },
    error = \(e) print(e)
  )
  div(card, style = card_styles)
}

ambhtmx(host = "0.0.0.0", port = "7860", protocol ="http")$app$
  get("/", \(req, res) {
    card_3d_demo() |> send_page(res)
  })$
  start()