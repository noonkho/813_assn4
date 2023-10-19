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
    (metalLoc ?l1 - location ?g1 - metal ?l2 - location ?g2 - metal) ; Location of the two golds
    (response ?loc - location ?s - signal ?m - metal) ; Signal for proximity to a metal from a location
    (goldAt ?loc - location ?m - metal) ; Location of a single gold
    (gold_obtained ?m - metal) ; Whether or not a gold has been obtained
    (at ?loc - location) ; States positions
    (link ?l1 ?l2 - location) ; Link between two locations that can be travelled t
    (succ ?n1 ?n2 - num) ; For counting
    (can-scan ?loc - location) ; Can the agent still make a scan
    (scan-count ?n - num) ; Used to limit the amount of scans that can be made
)

;action for moving to a location that has not yet been visited
(:action move
        :parameters (?l1 ?l2 - location)
        :precondition (and
            (at ?l1)
            (link ?l1 ?l2)
        )
        :effect (and
            (at ?l2)
            (not (at ?l1))
        )
)

; Keeps track of the number of scan done. Must be at the
; location, not already can-scan, numbers are successors,
; and the scan-count is ?n1 but not already num4 (max count).
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

;action to scan the proximity to a gold from a certain location.
(:action scan
    :parameters (?loc - location ?s - signal ?m - metal)
    :precondition (and 
        (at ?loc)
        (can-scan ?loc)
    )
    :observe (response ?loc ?s ?m)
)

;Action to dig and obtain the gold when there is a strong signal
(:action dig
    :parameters (?loc - location ?m - metal)
    :precondition (and 
        (at ?loc)
        (response ?loc strong ?m)
        (goldAt ?loc ?m)
    )
    :effect (and 
        (gold_obtained ?m)
    )
)
)