[#-- @ftlvariable name="action" type="com.atlassian.bamboo.ww2.actions.chains.ViewChainResult" --]
[#-- @ftlvariable name="" type="com.atlassian.bamboo.ww2.actions.chains.ViewChainResult" --]

[#import "/lib/tests.ftl" as tests]

<html>
<head>
	[@ui.header pageKey='buildResult.tests.title' object='${immutablePlan.name} ${chainResultNumber}' title=true /]
    <meta name="tab" content="tests"/>
</head>

<body>

[@ui.header pageKey='buildResult.tests.title' /]
[#if chainResult?has_content && chainResult.finished && filteredTestResults??]
    [#assign testSummary = chainResult.testResultsSummary /]

    [@tests.displayTestInfo testSummary=testSummary quarantineEnabled=testQuarantineEnabled/]
    [@tests.displayTestSummary testResults=filteredTestResults testSummary=testSummary displayIgnored=true showJob=true /]

    [#if !testSummary.hasFailedTestResults() && immutableChain.allJobs.size() == 1]
        [#assign onlyJob = immutableChain.allJobs.iterator().next() /]

        <p>See detailed test results for <a href="${baseUrl}/browse/${onlyJob.key}-${buildNumber}/test">${onlyJob.buildName}</a></p>
    [/#if]
[#else]
    No detailed test information available while the build is running.
[/#if]

</body>
</html>