(define (domain metal_detector)

(:requirements :strips :typing :negative-preconditions)

(:types 
    location signal metal num
)

(:constants
        l11 l12 l13 l21 l22 l23 l31 l32 l33 - location
        empty weak strong - signal
        gold1 gold2 - metal
        num0 num1 num2 num3 num4 - num
)

(:predicates
    (metalLoc ?l1 - location ?g1 - metal ?l2 - location ?g2 - metal)
    (response ?loc - location ?s - signal ?m - metal)
    (goldAt ?loc - location ?m - metal)
    (gold_obtained ?m - metal)
    (at ?loc - location)
    (link ?l1 ?l2 - location)
    (equal ?o1 ?o2 - signal)
    (never_been ?loc - location)
    (succ ?n1 ?n2 - num) ; For counting
    (can-scan ?loc - location)
    (scan-count ?n - num)
)

(:action move_new_place
        :parameters (?l1 ?l2 - location)
        :precondition (and
            (at ?l1)
            (link ?l1 ?l2)
            (never_been ?l2)
        )
        :effect (and
            (at ?l2)
            (not (at ?l1))
            (not (never_been ?l2))
        )
)

; Keeps track of the number of scan done. Must be at the
;  location, not already can-scan, numbers are successors,
;  and the scan-count is ?n1 but not already num4 (max count).
(:action setup-scan
    :parameters (?loc - location ?n1 ?n2 - num)
    :precondition (and
        (at ?loc)
        (not (can-scan ?loc))
        (succ ?n1 ?n2)
        (scan-count ?n1)
        (not (scan-count num4))
    )
    :effect (and
        (scan-count ?n2)
        (not (scan-count ?n1))
        (can-scan ?loc)
    )
)

(:action scan
    :parameters (?loc - location ?s - signal ?m - metal)
    :precondition (and 
        (at ?loc)
        (can-scan ?loc)
    )
    :observe (response ?loc ?s ?m)
)

(:action dig
    :parameters (?loc - location ?s - signal ?m - metal)
    :precondition (and 
        (at ?loc)
        (response ?loc ?s ?m)
        (equal ?s strong)
        (goldAt ?loc ?m)
    )
    :effect (and 
        (gold_obtained ?m)
    )
)
)