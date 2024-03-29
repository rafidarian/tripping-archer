<?php $this->cache['en']['core_question'] = array (
  'adminreport' => 'Report on possible problems in your question database.',
  'availableq' => 'Available?',
  'badbase' => 'Bad base before **: {$a}**',
  'broken' => 'This is a "broken link", it points to a nonexistent file.',
  'byandon' => 'by <em>{$a->user}</em> on <em>{$a->time}</em>',
  'cannotcopybackup' => 'Could not copy backup file',
  'cannotcreate' => 'Could not create new entry in question_attempts table',
  'cannotcreatepath' => 'Cannot create path: {$a}',
  'cannotdeletecate' => 'You can\'t delete that category it is the default category for this context.',
  'cannotenable' => 'Question type {$a} cannot be created directly.',
  'cannotfindcate' => 'Could not find category record',
  'cannotfindquestionfile' => 'Could not find question data file in zip',
  'cannotgetdsfordependent' => 'Cannot get the specified dataset for a dataset dependent question! (question: {$a->id}, datasetitem: {$a->item})',
  'cannotgetdsforquestion' => 'Cannot get the specified dataset for a calculated question! (question: {$a})',
  'cannothidequestion' => 'Was not able to hide question',
  'cannotimportformat' => 'Sorry, importing this format is not yet implemented!',
  'cannotinsertquestion' => 'Could not insert new question!',
  'cannotinsertquestioncatecontext' => 'Could not insert the new question category {$a->cat} illegal contextid {$a->ctx}',
  'cannotloadquestion' => 'Could not load question',
  'cannotmovequestion' => 'You can\'t use this script to move questions that have files associated with them from different areas.',
  'cannotopenforwriting' => 'Cannot open for writing: {$a}',
  'cannotpreview' => 'You can\'t preview these questions!',
  'cannotretrieveqcat' => 'Could not retrieve question category',
  'cannotunhidequestion' => 'Failed to unhide the question.',
  'cannotunzip' => 'Could not unzip file.',
  'cannotwriteto' => 'Cannot write exported questions to {$a}',
  'categorycurrent' => 'Current category',
  'categorycurrentuse' => 'Use this category',
  'categorydoesnotexist' => 'This category does not exist',
  'categorymoveto' => 'Save in category',
  'clicktoflag' => 'Click to flag this question',
  'clicktounflag' => 'Click to un-flag this question',
  'contexterror' => 'You shouldn\'t have got here if you\'re not moving a category to another context.',
  'copy' => 'Copy from {$a} and change links.',
  'created' => 'Created',
  'createdby' => 'Created by',
  'createdmodifiedheader' => 'Created / last saved',
  'createnewquestion' => 'Create a new question ...',
  'cwrqpfs' => 'Random questions selecting questions from sub categories.',
  'cwrqpfsinfo' => '<p>During the upgrade to Moodle 1.9 we will separate question categories into
different contexts. Some question categories and questions on your site will have to have their sharing
status changed. This is necessary in the rare case that one or more \'random\' questions in a quiz are set up to select from a mixture of
shared and unshared categories (as is the case on this site). This happens when a \'random\' question is set to select
from subcategories and one or more subcategories have a different sharing status to the parent category in which
the random question is created.</p>
<p>The following question categories, from which \'random\' questions in parent categories select questions from,
will have their sharing status changed to the same sharing status as the category with the \'random\' question in
on upgrading to Moodle 1.9. The following categories will have their sharing status changed. Questions which are
affected will continue to work in all existing quizzes until you remove them from these quizzes.</p>',
  'cwrqpfsnoprob' => 'No question categories in your site are affected by the \'Random questions selecting questions from sub categories\' issue.',
  'defaultfor' => 'Default for {$a}',
  'defaultinfofor' => 'The default category for questions shared in context \'{$a}\'.',
  'deletecoursecategorywithquestions' => 'There are questions in the question bank associated with this course category. If you proceed, they will be deleted. You may wish to move them first, using the question bank interface.',
  'disabled' => 'Disabled',
  'disterror' => 'The distribution {$a} caused problems',
  'donothing' => 'Don\'t copy or move files or change links.',
  'editcategories' => 'Edit categories',
  'editcategories_help' => 'Rather than keeping everything in one big list, questions may be arranged into categories and subcategories.

Each category has a context which determines where the questions in the category can be used:

* Activity context - Questions only available in the activity module
* Course context - Questions available in all activity modules in the course
* Course category context - Questions available in all activity modules and courses in the course category 
* System context - Questions available in all courses and activities on the site

Categories are also used for random questions, as questions are selected from a particular category.',
  'editcategories_link' => 'question/category',
  'editingcategory' => 'Editing a category',
  'editingquestion' => 'Editing a question',
  'editthiscategory' => 'Edit this category',
  'emptyxml' => 'Unkown error - empty imsmanifest.xml',
  'enabled' => 'Enabled',
  'erroraccessingcontext' => 'Cannot access context',
  'errordeletingquestionsfromcategory' => 'Error deleting questions from category {$a}.',
  'errorduringpost' => 'Error occurred during post-processing!',
  'errorduringpre' => 'Error occurred during pre-processing!',
  'errorduringproc' => 'Error occurred during processing!',
  'errorduringregrade' => 'Could not regrade question {$a->qid}, going to state {$a->stateid}.',
  'errorfilecannotbecopied' => 'Error: cannot copy file {$a}.',
  'errorfilecannotbemoved' => 'Error: cannot move file {$a}.',
  'errorfileschanged' => 'Error: files linked to from questions have changed since form was displayed.',
  'errormanualgradeoutofrange' => 'The grade {$a->grade} is not between 0 and {$a->maxgrade} for question {$a->name}. The score and comment have not been saved.',
  'errormovingquestions' => 'Error while moving questions with ids {$a}.',
  'errorpostprocess' => 'Error occurred during post-processing!',
  'errorpreprocess' => 'Error occurred during pre-processing!',
  'errorprocess' => 'Error occurred during processing!',
  'errorprocessingresponses' => 'An error occurred while processing your responses.',
  'errorsavingcomment' => 'Error saving the comment for question {$a->name} in the database.',
  'errorupdatingattempt' => 'Error updating attempt {$a->id} in the database.',
  'exportcategory' => 'Export category',
  'exportcategory_help' => 'This setting determines the category from which the exported questions will be taken.

Certain import formats, such as GIFT and Moodle XML, permit category and context data to be included in the export file, enabling them to (optionally) be recreated on import. If required, the appropriate checkboxes should be ticked.',
  'exporterror' => 'Errors occur during exporting!',
  'exportfilename' => 'questions',
  'exportnameformat' => '%Y%m%d-%H%M',
  'exportquestions' => 'Export questions to file',
  'exportquestions_help' => 'This function enables the export of a complete category (and any subcategories) of questions to file. Please note that, depending on the file format selected, some question data and certain question types may not be exported.',
  'exportquestions_link' => 'question/export',
  'filecantmovefrom' => 'The questions files cannot be moved because you do not have permission to remove files from the place you are trying to move questions from.',
  'filecantmoveto' => 'The question files cannot be moved or copied becuase you do not have permission to add files to the place you are trying to move the questions to.',
  'filesareacourse' => 'the course files area',
  'filesareasite' => 'the site files area',
  'filestomove' => 'Move / copy files to {$a}?',
  'flagged' => 'Flagged',
  'flagthisquestion' => 'Flag this question',
  'formquestionnotinids' => 'Form contained question that is not in questionids',
  'fractionsnomax' => 'One of the answers should have a score of 100% so it is possible to get full marks for this question.',
  'getcategoryfromfile' => 'Get category from file',
  'getcontextfromfile' => 'Get context from file',
  'changepublishstatuscat' => '<a href="{$a->caturl}">Category "{$a->name}"</a> in course "{$a->coursename}" will have it\'s sharing status changed from <strong>{$a->changefrom} to {$a->changeto}</strong>.',
  'chooseqtypetoadd' => 'Choose a question type to add',
  'ignorebroken' => 'Ignore broken links',
  'impossiblechar' => 'Impossible character {$a} detected as parenthesis character',
  'importcategory' => 'Import category',
  'importcategory_help' => 'This setting determines the category into which the imported questions will go.

Certain import formats, such as GIFT and Moodle XML, may include category and context data in the import file. To make use of this data, rather than the selected category, the appropriate checkboxes should be ticked. If categories specified in the import file do not exist, they will be created.',
  'importquestions' => 'Import questions from file',
  'importquestions_help' => 'This function enables questions in a variety of formats to be imported via text file. Note that the file must use UTF-8 encoding.',
  'importquestions_link' => 'question/import',
  'invalidarg' => 'No valid arguments supplied or incorrect server configuration',
  'invalidcategoryidforparent' => 'Invalid category id for parent!',
  'invalidcategoryidtomove' => 'Invalid category id to move!',
  'invalidconfirm' => 'Confirmation string was incorrect',
  'invalidcontextinhasanyquestions' => 'Invalid context passed to question_context_has_any_questions.',
  'invalidwizardpage' => 'Incorrect or no wizard page specified!',
  'lastmodifiedby' => 'Last modified by',
  'linkedfiledoesntexist' => 'Linked file {$a} doesn\'t exist',
  'makechildof' => 'Make child of \'{$a}\'',
  'maketoplevelitem' => 'Move to top level',
  'matchgrades' => 'Match grades',
  'matchgrades_help' => 'Imported grades must match one of the fixed list of valid grades - 100, 90, 80, 75, 70, 66.666, 60, 50, 40, 33.333, 30, 25, 20, 16.666, 14.2857, 12.5, 11.111, 10, 5, 0 (also negative values). If not, there are two options:

*  Error if grade not listed - If a question contains any grades not found in the list an error is displayed and that question will not be imported
* Nearest grade if not listed - If a grade is found that does not match a value in the list, the grade is changed to the closest matching value in the list ',
  'missingcourseorcmid' => 'Need to provide courseid or cmid to print_question.',
  'missingcourseorcmidtolink' => 'Need to provide courseid or cmid to get_question_edit_link.',
  'missingimportantcode' => 'This question type is missing important code: {$a}.',
  'missingoption' => 'The cloze question {$a} is missing its options',
  'modified' => 'Last saved',
  'move' => 'Move from {$a} and change links.',
  'movecategory' => 'Move category',
  'movedquestionsandcategories' => 'Moved questions and question categories from {$a->oldplace} to {$a->newplace}.',
  'movelinksonly' => 'Just change where links point to, do not move or copy files.',
  'moveq' => 'Move question(s)',
  'moveqtoanothercontext' => 'Move question to another context.',
  'movingcategory' => 'Moving category',
  'movingcategoryandfiles' => 'Are you sure you want to move category {$a->name} and all child categories to context for "{$a->contextto}"?<br /> We have detected {$a->urlcount} files linked from questions in {$a->fromareaname}, would you like to copy or move these to {$a->toareaname}?',
  'movingcategorynofiles' => 'Are you sure you want to move category "{$a->name}" and all child categories to context for "{$a->contextto}"?',
  'movingquestions' => 'Moving questions and any files',
  'movingquestionsandfiles' => 'Are you sure you want to move question(s) {$a->questions} to context for <strong>"{$a->tocontext}"</strong>?<br /> We have detected <strong>{$a->urlcount} files</strong> linked from these question(s) in {$a->fromareaname}, would you like to copy or move these to {$a->toareaname}?',
  'movingquestionsnofiles' => 'Are you sure you want to move question(s) {$a->questions} to context for <strong>"{$a->tocontext}"</strong>?<br /> There are <strong>no files</strong> linked from these question(s) in {$a->fromareaname}.',
  'needtochoosecat' => 'You need to choose a category to move this question to or press \'cancel\'.',
  'nocate' => 'No such category {$a}!',
  'nopermissionadd' => 'You don\'t have permission to add questions here.',
  'nopermissionmove' => 'You don\'t have permission to move questions from here. You must save the question in this category or save it as a new question.',
  'noprobs' => 'No problems found in your question database.',
  'notenoughdatatoeditaquestion' => 'Neither a question id, nor a category id and question type, was specified.',
  'notenoughdatatomovequestions' => 'You need to provide the question ids of questions you want to move.',
  'notflagged' => 'Not flagged',
  'novirtualquestiontype' => 'No virtual question type for question type {$a}',
  'parentcategory' => 'Parent category',
  'parentcategory_help' => 'The parent category is the one in which the new category will be placed. "Top" means that this category is not contained in any other category. Category contexts are shown in bold type. There must be at least one category in each context.',
  'parentcategory_link' => 'question/category',
  'parenthesisinproperclose' => 'Parenthesis before ** is not properly closed in {$a}**',
  'parenthesisinproperstart' => 'Parenthesis before ** is not properly started in {$a}**',
  'penaltyfactor' => 'Penalty factor',
  'penaltyfactor_help' => 'This setting determines what fraction of the achieved score is subtracted for each wrong response. It is only applicable if the quiz is run in adaptive mode.

The penalty factor should be a number between 0 and 1. A penalty factor of 1 means that the student has to get the answer right in his first response to get any credit for it at all. A penalty factor of 0 means the student can try as often as he likes and still get the full marks.',
  'permissionedit' => 'Edit this question',
  'permissionmove' => 'Move this question',
  'permissionsaveasnew' => 'Save this as a new question',
  'permissionto' => 'You have permission to :',
  'published' => 'shared',
  'qtypeveryshort' => 'T',
  'questionaffected' => '<a href="{$a->qurl}">Question "{$a->name}" ({$a->qtype})</a> is in this question category but is also being used in <a href="{$a->qurl}">quiz "{$a->quizname}"</a> in another course "{$a->coursename}".',
  'questionbank' => 'Question bank',
  'questioncategory' => 'Question category',
  'questioncatsfor' => 'Question categories for \'{$a}\'',
  'questiondoesnotexist' => 'This question does not exist',
  'questionname' => 'Question name',
  'questionsaveerror' => 'Errors occur during saving question - ({$a})',
  'questionsmovedto' => 'Questions still in use moved to "{$a}" in the parent course category.',
  'questionsrescuedfrom' => 'Questions saved from context {$a}.',
  'questionsrescuedfrominfo' => 'These questions (some of which may be hidden) were saved when context {$a} was deleted because they are still used by some quizzes or other activities.',
  'questiontype' => 'Question type',
  'questionuse' => 'Use question in this activity',
  'saveflags' => 'Save the state of the flags',
  'selectacategory' => 'Select a category:',
  'selectaqtypefordescription' => 'Select a question type to see its description.',
  'selectquestionsforbulk' => 'Select questions for bulk actions',
  'shareincontext' => 'Share in context for {$a}',
  'stoponerror' => 'Stop on error',
  'stoponerror_help' => 'This setting determines whether the import process stops when an error is detected, resulting in no questions being imported, or whether any questions containing errors are ignored and any valid questions are imported.',
  'tofilecategory' => 'Write category to file',
  'tofilecontext' => 'Write context to file',
  'unknown' => 'Unknown',
  'unknownquestiontype' => 'Unknown question type: {$a}.',
  'unknowntolerance' => 'Unknown tolerance type {$a}',
  'unpublished' => 'unshared',
  'upgradeproblemcategoryloop' => 'Problem detected when upgrading question categories. There is a loop in the category tree. The affected category ids are {$a}.',
  'upgradeproblemcouldnotupdatecategory' => 'Could not update question category {$a->name} ({$a->id}).',
  'upgradeproblemunknowncategory' => 'Problem detected when upgrading question categories. Category {$a->id} refers to parent {$a->parent}, which does not exist. Parent changed to fix problem.',
  'wrongprefix' => 'Wrongly formatted nameprefix {$a}',
  'youmustselectaqtype' => 'You must select a question type.',
  'yourfileshoulddownload' => 'Your export file should start to download shortly. If not, please <a href="{$a}">click here</a>.',
);