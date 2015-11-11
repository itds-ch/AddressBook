<g:if test="${flash.message}">
    <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
</g:if>
<g:if test="${flash.error}">
    <bootstrap:alert class="alert-danger">${flash.error}</bootstrap:alert>
</g:if>
<g:if test="${flash.success}">
    <bootstrap:alert class="alert-success">${flash.success}</bootstrap:alert>
</g:if>