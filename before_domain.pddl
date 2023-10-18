(define (domain metal_detector_before)

(:requirements :strips :typing :negative-preconditions)

(:types 
    location signal metal
)

(:constants
        l11 l12 l13 l21 l22 l23 l31 l32 l33 - location
        empty weak strong - signal
        gold1 gold2 - metal
)

(:predicates
    (metalLoc ?l1 - location ?g1 - metal ?l2 - location ?g2 - metal)
    (response ?l - location ?s - signal ?m - metal)
    (goldAt ?l - location ?m - metal)
    (gold_obtained ?m - metal)
    (at ?loc - location)
    (link ?l1 ?l2 - location)
    (equal ?o1 ?o2 - signal)
    
)

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

(:action scan
    :parameters (?loc - location ?s - signal ?m - metal)
    :precondition (and 
        (at ?loc)
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