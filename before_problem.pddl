(define (problem 3x3_grid_before) 

(:domain metal_detector_before)
(:init
    ;Initial Belief States
    (and
        ; Each gold is in one of the 9 locations
        (oneof (goldAt l11 gold1) (goldAt l12 gold1) (goldAt l13 gold1) (goldAt l21 gold1) (goldAt l22 gold1) (goldAt l23 gold1) (goldAt l31 gold1) (goldAt l32 gold1) (goldAt l33 gold1))
        (oneof (goldAt l11 gold2) (goldAt l12 gold2) (goldAt l13 gold2) (goldAt l21 gold2) (goldAt l22 gold2) (goldAt l23 gold2) (goldAt l31 gold2) (goldAt l32 gold2) (goldAt l33 gold2))

        ; (golds l11 gold1 l12 gold2)
        ; (or (not (golds l11 gold1 l12 gold2)) (goldAt l11 gold1) (goldAt l12 gold2))

        ; For each location, it can only has 1 gold
        (oneof (goldAt l11 gold1) (goldAt l11 gold2))
        (oneof (goldAt l12 gold1) (goldAt l12 gold2))
        (oneof (goldAt l13 gold1) (goldAt l13 gold2))
        (oneof (goldAt l21 gold1) (goldAt l21 gold2))
        (oneof (goldAt l22 gold1) (goldAt l22 gold2))
        (oneof (goldAt l23 gold1) (goldAt l23 gold2))
        (oneof (goldAt l31 gold1) (goldAt l31 gold2))
        (oneof (goldAt l32 gold1) (goldAt l32 gold2))
        (oneof (goldAt l33 gold1) (goldAt l33 gold2))


        ; Starting Position
        (not (at l11)) (not (at l12)) (not (at l13))
        (not (at l21)) (not (at l22)) (not (at l23))
        (at l31) (not (at l32)) (not (at l33))

        (not (gold_obtained gold1))
        (not (gold_obtained gold2))

        ; Ground Truths
        ; Links between locations up and down, left and right
            ; horizontal link
        (link l11 l12) (link l12 l11) (link l12 l13) (link l13 l12)
        (link l21 l22) (link l22 l21) (link l22 l23) (link l23 l22)
        (link l31 l32) (link l32 l31) (link l32 l33) (link l33 l32)
            ; vertical link
        (link l11 l21) (link l21 l11) (link l21 l31) (link l31 l21)
        (link l12 l22) (link l22 l21) (link l22 l32) (link l32 l22)
        (link l13 l23) (link l23 l13) (link l23 l33) (link l33 l23)

        ; Equal values
        ; signals
        (equal empty empty)
        (equal weak weak)
        (equal strong strong)
       


        ; For each location, (the location has gold) means the location is strong, surrounding locations (manhattan distance between the location and the gold = 1) are weak and the remaining are empty
        (or (not (goldAt l11 gold1)) (response l11 strong gold1))
        (or (not (goldAt l11 gold1)) (response l12 weak gold1))
        (or (not (goldAt l11 gold1)) (response l13 empty gold1))
        (or (not (goldAt l11 gold1)) (response l21 weak gold1))
        (or (not (goldAt l11 gold1)) (response l22 empty gold1))
        (or (not (goldAt l11 gold1)) (response l23 empty gold1))
        (or (not (goldAt l11 gold1)) (response l31 empty gold1))
        (or (not (goldAt l11 gold1)) (response l32 empty gold1))
        (or (not (goldAt l11 gold1)) (response l33 empty gold1))

        (or (not (goldAt l11 gold2)) (response l11 strong gold2))
        (or (not (goldAt l11 gold2)) (response l12 weak gold2))
        (or (not (goldAt l11 gold2)) (response l13 empty gold2))
        (or (not (goldAt l11 gold2)) (response l21 weak gold2))
        (or (not (goldAt l11 gold2)) (response l22 empty gold2))
        (or (not (goldAt l11 gold2)) (response l23 empty gold2))
        (or (not (goldAt l11 gold2)) (response l31 empty gold2))
        (or (not (goldAt l11 gold2)) (response l32 empty gold2))
        (or (not (goldAt l11 gold2)) (response l33 empty gold2))


        (or (not (goldAt l12 gold1)) (response l11 weak gold1))
        (or (not (goldAt l12 gold1)) (response l12 strong gold1))
        (or (not (goldAt l12 gold1)) (response l13 weak gold1))
        (or (not (goldAt l12 gold1)) (response l21 empty gold1))
        (or (not (goldAt l12 gold1)) (response l22 weak gold1))
        (or (not (goldAt l12 gold1)) (response l23 empty gold1))
        (or (not (goldAt l12 gold1)) (response l31 empty gold1))
        (or (not (goldAt l12 gold1)) (response l32 empty gold1))
        (or (not (goldAt l12 gold1)) (response l33 empty gold1))

        (or (not (goldAt l12 gold2)) (response l11 weak gold2))
        (or (not (goldAt l12 gold2)) (response l12 strong gold2))
        (or (not (goldAt l12 gold2)) (response l13 weak gold2))
        (or (not (goldAt l12 gold2)) (response l21 empty gold2))
        (or (not (goldAt l12 gold2)) (response l22 weak gold2))
        (or (not (goldAt l12 gold2)) (response l23 empty gold2))
        (or (not (goldAt l12 gold2)) (response l31 empty gold2))
        (or (not (goldAt l12 gold2)) (response l32 empty gold2))
        (or (not (goldAt l12 gold2)) (response l33 empty gold2))


        (or (not (goldAt l13 gold1)) (response l11 empty gold1))
        (or (not (goldAt l13 gold1)) (response l12 weak gold1))
        (or (not (goldAt l13 gold1)) (response l13 strong gold1))
        (or (not (goldAt l13 gold1)) (response l21 empty gold1))
        (or (not (goldAt l13 gold1)) (response l22 empty gold1))
        (or (not (goldAt l13 gold1)) (response l23 weak gold1))
        (or (not (goldAt l13 gold1)) (response l31 empty gold1))
        (or (not (goldAt l13 gold1)) (response l32 empty gold1))
        (or (not (goldAt l13 gold1)) (response l33 empty gold1))

        (or (not (goldAt l13 gold2)) (response l11 empty gold2))
        (or (not (goldAt l13 gold2)) (response l12 weak gold2))
        (or (not (goldAt l13 gold2)) (response l13 strong gold2))
        (or (not (goldAt l13 gold2)) (response l21 empty gold2))
        (or (not (goldAt l13 gold2)) (response l22 empty gold2))
        (or (not (goldAt l13 gold2)) (response l23 weak gold2))
        (or (not (goldAt l13 gold2)) (response l31 empty gold2))
        (or (not (goldAt l13 gold2)) (response l32 empty gold2))
        (or (not (goldAt l13 gold2)) (response l33 empty gold2))


        (or (not (goldAt l21 gold1)) (response l11 weak gold1))
        (or (not (goldAt l21 gold1)) (response l12 empty gold1))
        (or (not (goldAt l21 gold1)) (response l13 empty gold1))
        (or (not (goldAt l21 gold1)) (response l21 strong gold1))
        (or (not (goldAt l21 gold1)) (response l22 weak gold1))
        (or (not (goldAt l21 gold1)) (response l23 empty gold1))
        (or (not (goldAt l21 gold1)) (response l31 weak gold1))
        (or (not (goldAt l21 gold1)) (response l32 empty gold1))
        (or (not (goldAt l21 gold1)) (response l33 empty gold1))

        (or (not (goldAt l21 gold2)) (response l11 weak gold2))
        (or (not (goldAt l21 gold2)) (response l12 empty gold2))
        (or (not (goldAt l21 gold2)) (response l13 empty gold2))
        (or (not (goldAt l21 gold2)) (response l21 strong gold2))
        (or (not (goldAt l21 gold2)) (response l22 weak gold2))
        (or (not (goldAt l21 gold2)) (response l23 empty gold2))
        (or (not (goldAt l21 gold2)) (response l31 weak gold2))
        (or (not (goldAt l21 gold2)) (response l32 empty gold2))
        (or (not (goldAt l21 gold2)) (response l33 empty gold2))


        (or (not (goldAt l22 gold1)) (response l11 empty gold1))
        (or (not (goldAt l22 gold1)) (response l12 weak gold1))
        (or (not (goldAt l22 gold1)) (response l13 empty gold1))
        (or (not (goldAt l22 gold1)) (response l21 weak gold1))
        (or (not (goldAt l22 gold1)) (response l22 strong gold1))
        (or (not (goldAt l22 gold1)) (response l23 weak gold1))
        (or (not (goldAt l22 gold1)) (response l31 empty gold1))
        (or (not (goldAt l22 gold1)) (response l32 weak gold1))
        (or (not (goldAt l22 gold1)) (response l33 empty gold1))

        (or (not (goldAt l22 gold2)) (response l11 empty gold2))
        (or (not (goldAt l22 gold2)) (response l12 weak gold2))
        (or (not (goldAt l22 gold2)) (response l13 empty gold2))
        (or (not (goldAt l22 gold2)) (response l21 weak gold2))
        (or (not (goldAt l22 gold2)) (response l22 strong gold2))
        (or (not (goldAt l22 gold2)) (response l23 weak gold2))
        (or (not (goldAt l22 gold2)) (response l31 empty gold2))
        (or (not (goldAt l22 gold2)) (response l32 weak gold2))
        (or (not (goldAt l22 gold2)) (response l33 empty gold2))


        (or (not (goldAt l23 gold1)) (response l11 empty gold1))
        (or (not (goldAt l23 gold1)) (response l12 empty gold1))
        (or (not (goldAt l23 gold1)) (response l13 weak gold1))
        (or (not (goldAt l23 gold1)) (response l21 empty gold1))
        (or (not (goldAt l23 gold1)) (response l22 weak gold1))
        (or (not (goldAt l23 gold1)) (response l23 strong gold1))
        (or (not (goldAt l23 gold1)) (response l31 empty gold1))
        (or (not (goldAt l23 gold1)) (response l32 empty gold1))
        (or (not (goldAt l23 gold1)) (response l33 weak gold1))

        (or (not (goldAt l23 gold2)) (response l11 empty gold2))
        (or (not (goldAt l23 gold2)) (response l12 empty gold2))
        (or (not (goldAt l23 gold2)) (response l13 weak gold2))
        (or (not (goldAt l23 gold2)) (response l21 empty gold2))
        (or (not (goldAt l23 gold2)) (response l22 weak gold2))
        (or (not (goldAt l23 gold2)) (response l23 strong gold2))
        (or (not (goldAt l23 gold2)) (response l31 empty gold2))
        (or (not (goldAt l23 gold2)) (response l32 empty gold2))
        (or (not (goldAt l23 gold2)) (response l33 weak gold2))


        (or (not (goldAt l31 gold1)) (response l11 empty gold1))
        (or (not (goldAt l31 gold1)) (response l12 empty gold1))
        (or (not (goldAt l31 gold1)) (response l13 empty gold1))
        (or (not (goldAt l31 gold1)) (response l21 weak gold1))
        (or (not (goldAt l31 gold1)) (response l22 empty gold1))
        (or (not (goldAt l31 gold1)) (response l23 empty gold1))
        (or (not (goldAt l31 gold1)) (response l31 strong gold1))
        (or (not (goldAt l31 gold1)) (response l32 weak gold1))
        (or (not (goldAt l31 gold1)) (response l33 empty gold1))

        (or (not (goldAt l31 gold2)) (response l11 empty gold2))
        (or (not (goldAt l31 gold2)) (response l12 empty gold2))
        (or (not (goldAt l31 gold2)) (response l13 empty gold2))
        (or (not (goldAt l31 gold2)) (response l21 weak gold2))
        (or (not (goldAt l31 gold2)) (response l22 empty gold2))
        (or (not (goldAt l31 gold2)) (response l23 empty gold2))
        (or (not (goldAt l31 gold2)) (response l31 strong gold2))
        (or (not (goldAt l31 gold2)) (response l32 weak gold2))
        (or (not (goldAt l31 gold2)) (response l33 empty gold2))


        (or (not (goldAt l32 gold1)) (response l11 empty gold1))
        (or (not (goldAt l32 gold1)) (response l12 empty gold1))
        (or (not (goldAt l32 gold1)) (response l13 empty gold1))
        (or (not (goldAt l32 gold1)) (response l21 empty gold1))
        (or (not (goldAt l32 gold1)) (response l22 weak gold1))
        (or (not (goldAt l32 gold1)) (response l23 empty gold1))
        (or (not (goldAt l32 gold1)) (response l31 weak gold1))
        (or (not (goldAt l32 gold1)) (response l32 strong gold1))
        (or (not (goldAt l32 gold1)) (response l33 weak gold1))

        (or (not (goldAt l32 gold2)) (response l11 empty gold2))
        (or (not (goldAt l32 gold2)) (response l12 empty gold2))
        (or (not (goldAt l32 gold2)) (response l13 empty gold2))
        (or (not (goldAt l32 gold2)) (response l21 empty gold2))
        (or (not (goldAt l32 gold2)) (response l22 weak gold2))
        (or (not (goldAt l32 gold2)) (response l23 empty gold2))
        (or (not (goldAt l32 gold2)) (response l31 weak gold2))
        (or (not (goldAt l32 gold2)) (response l32 strong gold2))
        (or (not (goldAt l32 gold2)) (response l33 weak gold2))


        (or (not (goldAt l33 gold1)) (response l11 empty gold1))
        (or (not (goldAt l33 gold1)) (response l12 empty gold1))
        (or (not (goldAt l33 gold1)) (response l13 empty gold1))
        (or (not (goldAt l33 gold1)) (response l21 empty gold1))
        (or (not (goldAt l33 gold1)) (response l22 empty gold1))
        (or (not (goldAt l33 gold1)) (response l23 weak gold1))
        (or (not (goldAt l33 gold1)) (response l31 empty gold1))
        (or (not (goldAt l33 gold1)) (response l32 weak gold1))
        (or (not (goldAt l33 gold1)) (response l33 strong gold1))

        (or (not (goldAt l33 gold2)) (response l11 empty gold2))
        (or (not (goldAt l33 gold2)) (response l12 empty gold2))
        (or (not (goldAt l33 gold2)) (response l13 empty gold2))
        (or (not (goldAt l33 gold2)) (response l21 empty gold2))
        (or (not (goldAt l33 gold2)) (response l22 empty gold2))
        (or (not (goldAt l33 gold2)) (response l23 weak gold2))
        (or (not (goldAt l33 gold2)) (response l31 empty gold2))
        (or (not (goldAt l33 gold2)) (response l32 weak gold2))
        (or (not (goldAt l33 gold2)) (response l33 strong gold2))
    )
)   

(:goal (and
    (gold_obtained gold1)
    (gold_obtained gold2)
    
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)