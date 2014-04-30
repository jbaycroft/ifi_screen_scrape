require 'test_helper'

class CaseinfosControllerTest < ActionController::TestCase
  setup do
    @caseinfo = caseinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caseinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caseinfo" do
    assert_difference('Caseinfo.count') do
      post :create, caseinfo: { activeexpiredremedial: @caseinfo.activeexpiredremedial, alj: @caseinfo.alj, appealstatus: @caseinfo.appealstatus, archivist: @caseinfo.archivist, beginenddates: @caseinfo.beginenddates, country: @caseinfo.country, currentphase: @caseinfo.currentphase, disposition: @caseinfo.disposition, exclusioncdorders: @caseinfo.exclusioncdorders, gcattorney: @caseinfo.gcattorney, invno: @caseinfo.invno, invtermdate: @caseinfo.invtermdate, itmoc: @caseinfo.itmoc, notes: @caseinfo.notes, noticeofinv: @caseinfo.noticeofinv, ouiiattorney: @caseinfo.ouiiattorney, patno: @caseinfo.patno, proceedtype: @caseinfo.proceedtype, publishopinion: @caseinfo.publishopinion, relatedcourtdecision: @caseinfo.relatedcourtdecision, respondents: @caseinfo.respondents, statusbeforecommission: @caseinfo.statusbeforecommission, targetdate: @caseinfo.targetdate, uain: @caseinfo.uain, unfairactsfound: @caseinfo.unfairactsfound, violationfinalduedate: @caseinfo.violationfinalduedate }
    end

    assert_redirected_to caseinfo_path(assigns(:caseinfo))
  end

  test "should show caseinfo" do
    get :show, id: @caseinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caseinfo
    assert_response :success
  end

  test "should update caseinfo" do
    patch :update, id: @caseinfo, caseinfo: { activeexpiredremedial: @caseinfo.activeexpiredremedial, alj: @caseinfo.alj, appealstatus: @caseinfo.appealstatus, archivist: @caseinfo.archivist, beginenddates: @caseinfo.beginenddates, country: @caseinfo.country, currentphase: @caseinfo.currentphase, disposition: @caseinfo.disposition, exclusioncdorders: @caseinfo.exclusioncdorders, gcattorney: @caseinfo.gcattorney, invno: @caseinfo.invno, invtermdate: @caseinfo.invtermdate, itmoc: @caseinfo.itmoc, notes: @caseinfo.notes, noticeofinv: @caseinfo.noticeofinv, ouiiattorney: @caseinfo.ouiiattorney, patno: @caseinfo.patno, proceedtype: @caseinfo.proceedtype, publishopinion: @caseinfo.publishopinion, relatedcourtdecision: @caseinfo.relatedcourtdecision, respondents: @caseinfo.respondents, statusbeforecommission: @caseinfo.statusbeforecommission, targetdate: @caseinfo.targetdate, uain: @caseinfo.uain, unfairactsfound: @caseinfo.unfairactsfound, violationfinalduedate: @caseinfo.violationfinalduedate }
    assert_redirected_to caseinfo_path(assigns(:caseinfo))
  end

  test "should destroy caseinfo" do
    assert_difference('Caseinfo.count', -1) do
      delete :destroy, id: @caseinfo
    end

    assert_redirected_to caseinfos_path
  end
end
