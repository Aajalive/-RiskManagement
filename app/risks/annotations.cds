using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Risk Overview',
            ID : 'RiskOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk Details',
                    ID : 'RiskDetails',
                    Target : '@UI.FieldGroup#RiskDetails',
                },
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigation Overview',
            ID : 'MitigationOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Mitigation Details',
                    ID : 'MitigationDetails',
                    Target : '@UI.FieldGroup#MitigationDetails',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>Mitigation}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Priority}',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            Criticality : criticality,
        },
    ],
    UI.SelectionFields : [
        prio_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    },
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : 'descr',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : 'owner',
            },
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'title',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : 'impact',
            },
        ],
    },
    UI.FieldGroup #MitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : 'miti_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : 'owner',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : '{i18n>Timeline}',
            },
        ],
    },
);

annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
    }
};

annotate service.Risks with {
    prio @(
        Common.Label : '{i18n>Priority}',
        Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

