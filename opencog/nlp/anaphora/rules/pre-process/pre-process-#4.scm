;; target is "few" and there does not exist "of" after it.

(define pre-process-#4
    (BindLink
        (ListLink
            (TypedVariableLink
                (VariableNode "$target")
                (VariableTypeNode "WordInstanceNode")
            )
            (TypedVariableLink
                (VariableNode "$word")
                (VariableTypeNode "WordInstanceNode")
            )
        )
        (ImplicationLink
            (AndLink
                (ListLink
                    (AnchorNode "CurrentTarget")
                    (VariableNode "$target")
                )
                (LemmaLink
                    (VariableNode "$target")
                    (WordNode "few")
                )
                (NotLink
                    (EvaluationLink
                        (PrepositionalRelationshipNode "of")
                        (ListLink
                            (VariableNode "$target")
                            (VariableNode "$word")
                        )
                    )
                )
            )
            (ListLink
                (InheritanceLink
                    (VariableNode "$target")
                    (DefinedLinguisticConceptNode "plural")
                )
                (AnchorNode "CurrentResult")
                (AnchorNode "Matched")
            )
        )
    )
)
