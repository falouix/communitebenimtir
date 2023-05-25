<a class="btn btn-warning" id="bulk_publish_btn"><i class="voyager-trash"></i> <span>Publier la sélection</span></a>

{{-- Bulk publish modal --}}
<div class="modal modal-warning fade" tabindex="-1" id="bulk_publish_modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">
                    <i class="voyager-trash"></i> Etes-vous sûr de vouloir publier <span id="bulk_publish_count"></span> <span id="bulk_publish_display_name"></span>?
                </h4>
            </div>
            <div class="modal-body" id="bulk_publish_modal_body">
            </div>
            <div class="modal-footer">
                <form action="{{ route('voyager.'.$dataType->slug.'.index') }}" id="bulk_publish_form" method="GET">
                    <input type="hidden" name="PUBLISH" id="PUBLISH" value="true">
                    {{ csrf_field() }}
                    <input type="hidden" name="ids" id="bulk_publish_input" value="">
                    <input type="submit" class="btn btn-warning pull-right publish-confirm"
                             value="Publier {{ strtolower($dataType->display_name_plural) }}">
                </form>
                <button type="button" class="btn btn-default pull-right" data-dismiss="modal">
                    {{ __('voyager::generic.cancel') }}
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
window.onload = function () {
    // Bulk publish selectors
    var $bulkpublishBtn = $('#bulk_publish_btn');
    var $bulkpublishModal = $('#bulk_publish_modal');
    var $bulkpublishCount = $('#bulk_publish_count');
    var $bulkpublishDisplayName = $('#bulk_publish_display_name');
    var $bulkpublishInput = $('#bulk_publish_input');
    // Reposition modal to prevent z-index issues
    $bulkpublishModal.appendTo('body');
    // Bulk publish listener
    $bulkpublishBtn.click(function () {
        var ids = [];
        var $checkedBoxes = $('#dataTable input[type=checkbox]:checked').not('.select_all');
        var count = $checkedBoxes.length;
        if (count) {
            // Reset input value
            $bulkpublishInput.val('');
            // Deletion info
            var displayName = count > 1 ? '{{ $dataType->display_name_plural }}' : '{{ $dataType->display_name_singular }}';
            displayName = displayName.toLowerCase();
            $bulkpublishCount.html(count);
            $bulkpublishDisplayName.html(displayName);
            // Gather IDs
            $.each($checkedBoxes, function () {
                var value = $(this).val();
                ids.push(value);
            })
            // Set input value
            $bulkpublishInput.val(ids);
            // Show modal
            $bulkpublishModal.modal('show');
        } else {
            // No row selected
            toastr.warning('Vous n\'avez sélectionné aucun élément à publier');
        }
    });
}
</script>
